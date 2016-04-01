class CoreController < ApplicationController
  def index
  	# grid 4x4
  	# grid good filled
  	#grid = '1423234132144132'
  	# grid 16x16
  	# good filled
  	#grid = 'AB89F14DE235G67C15D69E78GFBC23A43ECGB256A4D78F91472FAGC39861DE5BG431796C5AEDB82FFC5E2431B6987ADG26BD85GAC71F94E389A7EBDF432GC165687AGFB41C52E93DEDFC63897BG4A512B39457128DAEFCG651G2CDAE39F64B87CF13482G6E795DBA7G4BDAE5F18362C992E516FBDGCA3748DA683C97254B1GFE'
  	# good not filled
  	#grid = '00DC00900806F010000G08D09001B60EA00000000000000D6800700E02300090070DEA00000009C0C0030G200F000B00E00BF0600019070590GF0D570000000A0308640000E500B00502C000014FEG030C0100B0009254D7B0FA2500700090080E35D0026900C00000005EA0070300F22GB0078CD0003E01000000GF0E006850'
  	# bad not filled
  	#grid = '1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1A0BC1'
  	# grid 9x9
  	# good filled
  	grid = '794238651526714983813956427249875136675321849381649572938567214457192368162483795'
  	# good not filled
  	#grid = '070400000009013006006005307060130002010080030500092080307200100400950200000001040'
  	@sudoku = Sudoku.new grid, 3
  	@sudoku_manager = SudokuManager.new grid
  end
end
