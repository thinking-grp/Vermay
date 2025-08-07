abstract class VermayEntity {}

abstract class VermayTablet {}

abstract class VermayInterface {}

class VermayStorage extends VermayEntity implements VermayInterface {}

class VermayIndex extends VermayEntity implements VermayTablet {}

class VermayBarrel extends VermayEntity implements VermayTablet, VermayInterface {}