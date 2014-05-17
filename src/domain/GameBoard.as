package domain 
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;	/**
	 * ...
	 * @author Pieter Verhoeven
	 */
	public class GameBoard extends World
	{
		private var _size : int = 5;
		private var _offset : int = 10;
		private var _tiles : Vector.<Vector.<Tile>>;
		private var _selectedTile : Tile;
		
		public function GameBoard()
		{
			_tiles = new Vector.<Vector.<Tile>>();
			for ( var i : Number = 0; i < _size; i++) {
				for (var j : Number = 0; j < _size; j++) {
					tiles[i] = new Vector.<Tile>(_size);
					var tile : Tile = new Tile();
					tile.x = (i * tile.width) + _offset;
					tile.y = (j * tile.height) + _offset;
					tile.row = i;
					tile.col = j;
					_tiles[i][j] = tile;
					add(tile);
				}
			}
		}
		
		public function checkifScored() : void {
			
		}
		
		
		override public function update(): void {
			super.update();
		}
		
		public function tileClicked() : void{
			
		}
		
		public function get tiles():Vector.<Vector.<Tile>> 
		{
			return _tiles;
		}
		
		public function get selectedTile():Tile 
		{
			return _selectedTile;
		}
		
		public function set selectedTile(value:Tile):void 
		{
			_selectedTile = value;
		}
	}
}