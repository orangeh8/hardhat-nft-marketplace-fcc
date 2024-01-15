require("dotenv").config()
const fs = require("fs")
const { network } = require("hardhat")

const { imetaidFrontEnd } = require("../helper-hardhat-config")

const FRONTEND_CONFIG_PATH = imetaidFrontEnd;

module.exports = async () => {
    if (process.env.UPDATE_FRONT_END === true) {
        console.log("imetaid Writing to front end...")
        await updateContractAddresses("NftMarketplace")
        await updateContractAddresses("BasicNft")
        await updateContractAddresses("BasicNftTwo")
        await updateAbi("NftMarketplace")
        await updateAbi("BasicNft")
        await updateAbi("BasicNftTwo")
        console.log("Front end written!")
    }
}

async function updateAbi(contractName) {
    const contract = await ethers.getContract(contractName)
    const abi = JSON.parse(fs.readFileSync(`${FRONTEND_CONFIG_PATH}abi.json`, "utf8"))
    abi[contractName] = JSON.parse(contract.interface.format(ethers.utils.FormatTypes.json))
    fs.writeFileSync(`${FRONTEND_CONFIG_PATH}abi.json`, JSON.stringify(abi))
}

async function updateContractAddresses(contractName) {
    const chainId = network.config.chainId.toString()
    const contract = await ethers.getContract(contractName)
    const contractAddresses = JSON.parse(fs.readFileSync(`${FRONTEND_CONFIG_PATH}contract.json`, "utf8"))
    if (chainId in contractAddresses) {
        contractAddresses[chainId] = { ...contractAddresses[chainId], [contractName]: contract.address }
    } else {
        contractAddresses[chainId] = { [contractName]: contract.address }
    }
    fs.writeFileSync(`${FRONTEND_CONFIG_PATH}contract.json`, JSON.stringify(contractAddresses))
}
module.exports.tags = ["all", "imetaid"]
