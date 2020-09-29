let elementTree = ""
let recursiveCount = 0

function writeTree() {
	let nodeList = document.getElementById("html").children

	elementTree += "<!DOCTYPE html>\n<html>\n"
	nodesOutput(nodeList)
	elementTree += "\n</html>"

	console.log(elementTree)

	let text = document.createTextNode(elementTree)
	document.getElementById("htmlOutput").appendChild(text)
}

function nodesOutput(nodes) {
	recursiveCount += 1

	for (let i = 0; i < nodes.length; i++) {
		if (i != 0) elementTree += "\n"
		for (let j = 0; j < recursiveCount; j++) elementTree += "\u00A0\u00A0\u00A0\u00A0";

		elementTree += "<" + nodes[i].localName + ">"
		if (nodes[i].children.length != 0) {
			elementTree += "\n"
			nodesOutput(nodes[i].children)

			elementTree += "\n"
			recursiveCount -= 1
			for (let j = 0; j < recursiveCount; j++) elementTree += "\u00A0\u00A0\u00A0\u00A0";
			elementTree += "</" + nodes[i].localName + ">"
		} else {
			elementTree += "</" + nodes[i].localName + ">"
		}
	}
}
