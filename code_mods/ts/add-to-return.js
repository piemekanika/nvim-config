#!/usr/bin/env node
import fs from 'fs/promises'
import path from 'path'
import jscodeshift from 'jscodeshift'

async function modifySetupFunction(filePath, symbolToAdd) {
	try {
		// Read the file
		const source = await fs.readFile(filePath, 'utf-8')

		// Parse the source with jscodeshift
		const j = jscodeshift.withParser('tsx')
		const root = j(source)

		// Find all setup functions
		const setupFunctions = root
			.find(j.ObjectMethod)
			.filter((node) => node.node.key.name === 'setup')

		if (setupFunctions.length === 0) {
			console.error('No setup function found in the file')
			process.exit(1)
		}

		let modified = false

		setupFunctions.forEach((setupPath) => {
			const setupFunction = setupPath.node
			const functionBody = setupFunction.body

			// Check if the body is a block statement
			if (functionBody.type !== 'BlockStatement') {
				console.error('Setup function body is not a block statement')
				process.exit(1)
			}

			// Find return statements in the function body
			const returnStatements = j(setupPath).find(j.ReturnStatement)

			if (returnStatements.length === 0) {
				// No return statement, create one with the symbol
				const returnObj = j.objectExpression([
					j.property(
						'init',
						j.identifier(symbolToAdd),
						j.identifier(symbolToAdd),
					),
				])

				const returnStatement = j.returnStatement(returnObj)
				functionBody.body.push(returnStatement)
				modified = true
			} else {
				// For each return statement
				returnStatements.forEach((returnPath) => {
					const returnArgument = returnPath.node.argument

					// Check if return value is an object
					if (returnArgument.type !== 'ObjectExpression') {
						console.error('Return value is not an object')
						process.exit(1)
					}

					// Check if the symbol is already in the return object
					const existingProperty = returnArgument.properties.find(
						(prop) => prop.key.name === symbolToAdd,
					)

					if (!existingProperty) {
						// Add the symbol to the return object
						const prop = j.property(
							'init',
							j.identifier(symbolToAdd),
							j.identifier(symbolToAdd),
						)
						prop.shorthand = true

						returnArgument.properties.push(prop)
						modified = true
					}
				})
			}
		})

		if (!modified) {
			console.log(
				'No changes needed or symbol already exists in the return object',
			)
			return
		}

		// Write the modified code back to the file
		const modifiedSource = root.toSource({ trailingComma: true })
		await fs.writeFile(filePath, modifiedSource, 'utf-8')
		console.log(
			`Successfully added symbol '${symbolToAdd}' to setup function return in ${filePath}`,
		)
	} catch (error) {
		console.error('Error:', error.message)
		process.exit(1)
	}
}

// Main function to handle CLI arguments
async function main() {
	// Get command line arguments
	const args = process.argv.slice(2)

	if (args.length !== 2) {
		console.error('Usage: node script.js <file-path> <symbol-name>')
		process.exit(1)
	}

	const [filePath, symbolToAdd] = args

	// Resolve the file path
	const resolvedPath = path.resolve(process.cwd(), filePath)

	// Check if the file exists
	try {
		await fs.access(resolvedPath)
	} catch (error) {
		console.error(`File not found: ${resolvedPath}`)
		process.exit(1)
	}

	await modifySetupFunction(resolvedPath, symbolToAdd)
}

// Run the script
main().catch((error) => {
	console.error('Unhandled error:', error)
	process.exit(1)
})
