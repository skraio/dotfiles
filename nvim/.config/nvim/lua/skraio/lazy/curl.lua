return {
    "oysandvik94/curl.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function ()
        local curl = require("curl")
        curl.setup({
            ft = { "curl" },
            output_split_direction = 'horizontal',
        })
    end
}
