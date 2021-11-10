#
#  Panoramix v4 Oct 2019 
#  Decompiled source of 0x495f947276749Ce646f68AC8c248420045cb7b5e
# 
#  Let's make the world open source 
# 
#
#  I failed with these: 
#  - safeTransferFrom(address _from, address _to, uint256 _id, uint256 _value, bytes _data)
#  All the rest is below.
#

const unknown4060b25e = '2.0.0'
const unknownc311c523 = 1

def storage:
  stor0 is mapping of uint256 at storage 0
  stor1 is mapping of uint8 at storage 1
  owner is addr at storage 2
  unknowncd7c0326Address is addr at storage 3
  name is array of uint256 at storage 4
  symbol is array of uint256 at storage 5
  totalSupply is mapping of uint256 at storage 6
  unknownf923e8c3 is array of uint256 at storage 7
  uri is array of uint256 at storage 8
  stor9 is uint8 at storage 9
  stor10 is mapping of uint8 at storage 10
  creator is mapping of addr at storage 11

def name() payable: 
  return name[0 len name.length]

def uri(uint256 _id) payable: 
  return uri[_id][0 len uri[_id].length]

def creator(uint256 _tokenId) payable: 
  require calldata.size - 4 >= 32
  return creator[_tokenId]

def unknown73505d35(addr _param1) payable: 
  require calldata.size - 4 >= 32
  return bool(stor10[_param1])

def owner() payable: 
  return owner

def symbol() payable: 
  return symbol[0 len symbol.length]

def totalSupply(uint256 _id) payable: 
  require calldata.size - 4 >= 32
  return totalSupply[_id]

def unknowncd7c0326() payable: 
  return unknowncd7c0326Address

def unknownf923e8c3() payable: 
  return unknownf923e8c3[0 len unknownf923e8c3.length]

#
#  Regular functions
#

def _fallback() payable: # default function
  revert

def isOwner() payable: 
  return (caller == owner)

def exists(uint256 _tokenId) payable: 
  require calldata.size - 4 >= 32
  return (totalSupply[_tokenId] > 0)

def supportsInterface(bytes4 _interfaceId) payable: 
  require calldata.size - 4 >= 32
  if Mask(32, 224, _interfaceId) != 0x1ffc9a700000000000000000000000000000000000000000000000000000000:
      if Mask(32, 224, _interfaceId) != 0xd9b67a2600000000000000000000000000000000000000000000000000000000:
          return 0
  return 1

def setApprovalForAll(address _to, bool _approved) payable: 
  require calldata.size - 4 >= 64
  stor1[caller][addr(_to)] = uint8(_approved)
  log ApprovalForAll(
        address owner=_approved,
        address operator=caller,
        bool approved=_to)

def isApprovedForAll(address _owner, address _operator) payable: 
  require calldata.size - 4 >= 64
  if not stor10[addr(_operator)]:
      require ext_code.size(unknowncd7c0326Address)
      static call unknowncd7c0326Address.proxies(address param1) with:
              gas gas_remaining wei
             args _owner
      if not ext_call.success:
          revert with ext_call.return_data[0 len return_data.size]
      require return_data.size >= 32
      if ext_call.return_data_operator:
          return bool(stor1[addr(_owner)][addr(_operator)])
  return 1

def unknownd26ea6c0(addr _param1) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      if not stor10[caller]:
          require ext_code.size(unknowncd7c0326Address)
          static call unknowncd7c0326Address.proxies(address param1) with:
                  gas gas_remaining wei
                 args owner
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data[12 len 20] != caller:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          46,
                          0x44455243313135355472616461626c65236f6e6c794f776e65723a2043414c4c45525f49535f4e4f545f4f574e45,
                          mem[210 len 18]
  unknowncd7c0326Address = _param1

def renounceOwnership() payable: 
  if owner != caller:
      if not stor10[caller]:
          require ext_code.size(unknowncd7c0326Address)
          static call unknowncd7c0326Address.proxies(address param1) with:
                  gas gas_remaining wei
                 args owner
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data[12 len 20] != caller:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          46,
                          0x44455243313135355472616461626c65236f6e6c794f776e65723a2043414c4c45525f49535f4e4f545f4f574e45,
                          mem[210 len 18]
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)
  owner = 0

def unknown9e037eea(addr _param1) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      if not stor10[caller]:
          require ext_code.size(unknowncd7c0326Address)
          static call unknowncd7c0326Address.proxies(address param1) with:
                  gas gas_remaining wei
                 args owner
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data[12 len 20] != caller:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          46,
                          0x44455243313135355472616461626c65236f6e6c794f776e65723a2043414c4c45525f49535f4e4f545f4f574e45,
                          mem[210 len 18]
  stor10[addr(_param1)] = 0

def unknowna50aa5c3(addr _param1) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      if not stor10[caller]:
          require ext_code.size(unknowncd7c0326Address)
          static call unknowncd7c0326Address.proxies(address param1) with:
                  gas gas_remaining wei
                 args owner
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data[12 len 20] != caller:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          46,
                          0x44455243313135355472616461626c65236f6e6c794f776e65723a2043414c4c45525f49535f4e4f545f4f574e45,
                          mem[210 len 18]
  stor10[addr(_param1)] = 1

def unknown24d88785(array _param1) payable: 
  require calldata.size - 4 >= 32
  require _param1 <= 4294967296
  require _param1 + 36 <= calldata.size
  require _param1.length <= 4294967296 and _param1 + _param1.length + 36 <= calldata.size
  if owner != caller:
      if not stor10[caller]:
          require ext_code.size(unknowncd7c0326Address)
          static call unknowncd7c0326Address.proxies(address param1) with:
                  gas gas_remaining wei
                 args owner
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data[12 len 20] != caller:
              revert with 0, 
                          32,
                          46,
                          0x44455243313135355472616461626c65236f6e6c794f776e65723a2043414c4c45525f49535f4e4f545f4f574e45,
                          mem[ceil32(_param1.length) + 242 len 18]
  unknownf923e8c3[] = Array(len=_param1.length, data=_param1[all])

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      if not stor10[caller]:
          require ext_code.size(unknowncd7c0326Address)
          static call unknowncd7c0326Address.proxies(address param1) with:
                  gas gas_remaining wei
                 args owner
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data[12 len 20] != caller:
              revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                          32,
                          46,
                          0x44455243313135355472616461626c65236f6e6c794f776e65723a2043414c4c45525f49535f4e4f545f4f574e45,
                          mem[210 len 18]
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  38,
                  0x544f776e61626c653a206e6577206f776e657220697320746865207a65726f20616464726573,
                  mem[202 len 26]
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)
  owner = _newOwner

def balanceOf(address _owner, uint256 _cardId) payable: 
  require calldata.size - 4 >= 64
  if not creator[_cardId]:
      if uint64(_cardId) != _owner:
          if not stor10[addr(_owner)]:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args uint64(_cardId)
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data_owner:
                  return stor0[addr(_owner)][_cardId]
  else:
      if creator[_cardId] != _owner:
          if not stor10[addr(_owner)]:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args creator[_cardId]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data_owner:
                  return stor0[addr(_owner)][_cardId]
  if totalSupply[_cardId] > _cardId % 1099511627776:
      revert with 0, 'SafeMath#sub: UNDERFLOW'
  if stor0[addr(_owner)][_cardId] + (_cardId % 1099511627776) - totalSupply[_cardId] < stor0[addr(_owner)][_cardId]:
      revert with 0, 'SafeMath#add: OVERFLOW'
  return (stor0[addr(_owner)][_cardId] + (_cardId % 1099511627776) - totalSupply[_cardId])

def unknown91686f53(uint256 _param1, addr _param2) payable: 
  require calldata.size - 4 >= 64
  if not creator[_param1]:
      if uint64(_param1) != caller:
          if not stor10[caller]:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args uint64(_param1)
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data[12 len 20] != caller:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                              32,
                              53,
                              0x454173736574436f6e74726163745368617265642363726561746f724f6e6c793a204f4e4c595f43524541544f525f414c4c4f5745,
                              mem[217 len 11]
  else:
      if creator[_param1] != caller:
          if not stor10[caller]:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args creator[_param1]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data[12 len 20] != caller:
                  revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                              32,
                              53,
                              0x454173736574436f6e74726163745368617265642363726561746f724f6e6c793a204f4e4c595f43524541544f525f414c4c4f5745,
                              mem[217 len 11]
  if not _param2:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  48,
                  0x734173736574436f6e74726163745368617265642373657443726561746f723a20494e56414c49445f41444452455353,
                  mem[212 len 16]
  creator[_param1] = _param2
  log 0x39071c63: _param1, _param2

def unknown4e1273f4(array _param1, array _param2) payable: 
  require calldata.size - 4 >= 64
  require _param1 <= 4294967296
  require _param1 + 36 <= calldata.size
  require _param1.length <= 4294967296 and _param1 + (32 * _param1.length) + 36 <= calldata.size
  mem[128 len 32 * _param1.length] = call.data[_param1 + 36 len 32 * _param1.length]
  require _param2 <= 4294967296
  require _param2 + 36 <= calldata.size
  require _param2.length <= 4294967296 and _param2 + (32 * _param2.length) + 36 <= calldata.size
  mem[(32 * _param1.length) + 128] = _param2.length
  mem[(32 * _param1.length) + 160 len 32 * _param2.length] = call.data[_param2 + 36 len 32 * _param2.length]
  if _param1.length != _param2.length:
      revert with 0, 
                  32,
                  44,
                  0x54455243313135352362616c616e63654f6642617463683a20494e56414c49445f41525241595f4c454e4754,
                  mem[(32 * _param1.length) + (32 * _param2.length) + 272 len 20]
  mem[(32 * _param1.length) + (32 * _param2.length) + 160] = _param1.length
  if _param1.length:
      mem[(32 * _param1.length) + (32 * _param2.length) + 192 len 32 * _param1.length] = code.data * _param1.length]
  idx = 0
  while idx < _param1.length:
      require idx < _param1.length
      require idx < _param2.length
      mem[0] = mem[(32 * idx) + (32 * _param1.length) + 160]
      mem[32] = sha3(mem[(32 * idx) + 140 len 20], 0)
      require idx < _param1.length
      mem[(32 * idx) + (32 * _param1.length) + (32 * _param2.length) + 192] = stor0[mem[(32 * idx) + 140 len 20]][mem[(32 * idx) + (32 * _param1.length) + 160]]
      idx = idx + 1
      continue 
  mem[(64 * _param1.length) + (32 * _param2.length) + 192] = 32
  mem[(64 * _param1.length) + (32 * _param2.length) + 224] = _param1.length
  mem[(64 * _param1.length) + (32 * _param2.length) + 256 len floor32(_param1.length)] = mem[(32 * _param1.length) + (32 * _param2.length) + 192 len floor32(_param1.length)]
  return memory
    from (64 * _param1.length) + (32 * _param2.length) + 192
     len (161 * _param1.length) + 64

def setURI(uint256 _id, string _uri) payable: 
  require calldata.size - 4 >= 64
  require _uri <= 4294967296
  require _uri + 36 <= calldata.size
  require _uri.length <= 4294967296 and _uri + _uri.length + 36 <= calldata.size
  mem[128 len _uri.length] = _uri[all]
  mem[_uri.length + 128] = 0
  if not creator[_id]:
      if uint64(_id) == caller:
          uri[_id][] = Array(len=_uri.length, data=_uri[all])
          mem[ceil32(_uri.length) + 128] = 32
          mem[ceil32(_uri.length) + 160] = _uri.length
          mem[ceil32(_uri.length) + 192 len ceil32(_uri.length)] = _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]
          if not _uri.length % 32:
              log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * _uri.length, -(8 * _uri.length) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * _uri.length) - 256, _id
          else:
              mem[floor32(_uri.length) + ceil32(_uri.length) + 192] = mem[floor32(_uri.length) + ceil32(_uri.length) + -(_uri.length % 32) + 224 len _uri.length % 32]
              log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * ceil32(_uri.length), -(8 * ceil32(_uri.length)) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * ceil32(_uri.length)) - 256, mem[(2 * ceil32(_uri.length)) + 192 len floor32(_uri.length) + -ceil32(_uri.length) + 32], _id
      else:
          if stor10[caller]:
              uri[_id][] = Array(len=_uri.length, data=_uri[all])
              mem[ceil32(_uri.length) + 128] = 32
              mem[ceil32(_uri.length) + 160] = _uri.length
              mem[ceil32(_uri.length) + 192 len ceil32(_uri.length)] = _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]
              if not _uri.length % 32:
                  log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * _uri.length, -(8 * _uri.length) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * _uri.length) - 256, _id
              else:
                  mem[floor32(_uri.length) + ceil32(_uri.length) + 192] = mem[floor32(_uri.length) + ceil32(_uri.length) + -(_uri.length % 32) + 224 len _uri.length % 32]
                  log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * ceil32(_uri.length), -(8 * ceil32(_uri.length)) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * ceil32(_uri.length)) - 256, mem[(2 * ceil32(_uri.length)) + 192 len floor32(_uri.length) + -ceil32(_uri.length) + 32], _id
          else:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args uint64(_id)
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data[12 len 20] != caller:
                  revert with 0, 
                              32,
                              53,
                              0x454173736574436f6e74726163745368617265642363726561746f724f6e6c793a204f4e4c595f43524541544f525f414c4c4f5745,
                              mem[ceil32(_uri.length) + 249 len 11]
              uri[_id][] = Array(len=_uri.length, data=_uri[all])
              mem[ceil32(_uri.length) + 128] = 32
              mem[ceil32(_uri.length) + 192 len ceil32(_uri.length)] = _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]
              if not _uri.length % 32:
                  log 0x6bb7ff70: 0, 32, _uri.length, Mask(8 * _uri.length, -(8 * _uri.length) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * _uri.length) - 256, _id
              else:
                  mem[floor32(_uri.length) + ceil32(_uri.length) + 192] = mem[floor32(_uri.length) + ceil32(_uri.length) + -(_uri.length % 32) + 224 len _uri.length % 32]
                  log 0x6bb7ff70: 0, 32, _uri.length, Mask(8 * ceil32(_uri.length), -(8 * ceil32(_uri.length)) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * ceil32(_uri.length)) - 256, mem[(2 * ceil32(_uri.length)) + 192 len floor32(_uri.length) + -ceil32(_uri.length) + 32], _id
  else:
      if creator[_id] == caller:
          uri[_id][] = Array(len=_uri.length, data=_uri[all])
          mem[ceil32(_uri.length) + 128] = 32
          mem[ceil32(_uri.length) + 160] = _uri.length
          mem[ceil32(_uri.length) + 192 len ceil32(_uri.length)] = _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]
          if not _uri.length % 32:
              log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * _uri.length, -(8 * _uri.length) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * _uri.length) - 256, _id
          else:
              mem[floor32(_uri.length) + ceil32(_uri.length) + 192] = mem[floor32(_uri.length) + ceil32(_uri.length) + -(_uri.length % 32) + 224 len _uri.length % 32]
              log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * ceil32(_uri.length), -(8 * ceil32(_uri.length)) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * ceil32(_uri.length)) - 256, mem[(2 * ceil32(_uri.length)) + 192 len floor32(_uri.length) + -ceil32(_uri.length) + 32], _id
      else:
          if stor10[caller]:
              uri[_id][] = Array(len=_uri.length, data=_uri[all])
              mem[ceil32(_uri.length) + 128] = 32
              mem[ceil32(_uri.length) + 160] = _uri.length
              mem[ceil32(_uri.length) + 192 len ceil32(_uri.length)] = _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]
              if not _uri.length % 32:
                  log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * _uri.length, -(8 * _uri.length) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * _uri.length) - 256, _id
              else:
                  mem[floor32(_uri.length) + ceil32(_uri.length) + 192] = mem[floor32(_uri.length) + ceil32(_uri.length) + -(_uri.length % 32) + 224 len _uri.length % 32]
                  log 0x6bb7ff70: Mask(8 * -ceil32(_uri.length) + _uri.length + 32, 0, 0), mem[_uri.length + 160 len ceil32(_uri.length) + -_uri.length + 32], Mask(8 * ceil32(_uri.length), -(8 * ceil32(_uri.length)) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * ceil32(_uri.length)) - 256, mem[(2 * ceil32(_uri.length)) + 192 len floor32(_uri.length) + -ceil32(_uri.length) + 32], _id
          else:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args creator[_id]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data[12 len 20] != caller:
                  revert with 0, 
                              32,
                              53,
                              0x454173736574436f6e74726163745368617265642363726561746f724f6e6c793a204f4e4c595f43524541544f525f414c4c4f5745,
                              mem[ceil32(_uri.length) + 249 len 11]
              uri[_id][] = Array(len=_uri.length, data=_uri[all])
              mem[ceil32(_uri.length) + 128] = 32
              mem[ceil32(_uri.length) + 192 len ceil32(_uri.length)] = _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]
              if not _uri.length % 32:
                  log 0x6bb7ff70: 0, 32, _uri.length, Mask(8 * _uri.length, -(8 * _uri.length) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * _uri.length) - 256, _id
              else:
                  mem[floor32(_uri.length) + ceil32(_uri.length) + 192] = mem[floor32(_uri.length) + ceil32(_uri.length) + -(_uri.length % 32) + 224 len _uri.length % 32]
                  log 0x6bb7ff70: 0, 32, _uri.length, Mask(8 * ceil32(_uri.length), -(8 * ceil32(_uri.length)) + 256, _uri[all], mem[_uri.length + 128 len ceil32(_uri.length) - _uri.length]) << (8 * ceil32(_uri.length)) - 256, mem[(2 * ceil32(_uri.length)) + 192 len floor32(_uri.length) + -ceil32(_uri.length) + 32], _id

def safeBatchTransferFrom(address _from, address _to, uint256[] _ids, uint256[] _values, bytes _data) payable: 
  require calldata.size - 4 >= 160
  require _ids <= 4294967296
  require _ids + 36 <= calldata.size
  require _ids.length <= 4294967296 and _ids + (32 * _ids.length) + 36 <= calldata.size
  mem[128 len 32 * _ids.length] = call.data[_ids + 36 len 32 * _ids.length]
  require _values <= 4294967296
  require _values + 36 <= calldata.size
  require _values.length <= 4294967296 and _values + (32 * _values.length) + 36 <= calldata.size
  mem[(32 * _ids.length) + 128] = _values.length
  mem[(32 * _ids.length) + 160 len 32 * _values.length] = call.data[_values + 36 len 32 * _values.length]
  require _data <= 4294967296
  require _data + 36 <= calldata.size
  require _data.length <= 4294967296 and _data + _data.length + 36 <= calldata.size
  mem[(32 * _ids.length) + (32 * _values.length) + 160] = _data.length
  mem[(32 * _ids.length) + (32 * _values.length) + 192 len _data.length] = _data[all]
  mem[(32 * _ids.length) + (32 * _values.length) + _data.length + 192] = 0
  if caller == _from:
      if not _to:
          revert with 0, 
                      32,
                      48,
                      0x4845524331313535237361666542617463685472616e7366657246726f6d3a20494e56414c49445f524543495049454e,
                      mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 308 len 16]
      if _ids.length != _values.length:
          revert with 0, 
                      32,
                      53,
                      0x5245524331313535235f7361666542617463685472616e7366657246726f6d3a20494e56414c49445f4152524159535f4c454e4754,
                      mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 313 len 11]
      idx = 0
      while idx < _ids.length:
          require idx < _values.length
          require idx < _ids.length
          if mem[(32 * idx) + (32 * _ids.length) + 160] > stor0[addr(_from)][mem[(32 * idx) + 128]]:
              revert with 0, 'SafeMath#sub: UNDERFLOW'
          require idx < _ids.length
          stor0[addr(_from)][mem[(32 * idx) + 128]] -= mem[(32 * idx) + (32 * _ids.length) + 160]
          require idx < _values.length
          require idx < _ids.length
          if stor0[addr(_to)][mem[(32 * idx) + 128]] + mem[(32 * idx) + (32 * _ids.length) + 160] < stor0[addr(_to)][mem[(32 * idx) + 128]]:
              revert with 0, 'SafeMath#add: OVERFLOW'
          require idx < _ids.length
          mem[0] = mem[(32 * idx) + 128]
          mem[32] = sha3(addr(_to), 0)
          stor0[addr(_to)][mem[(32 * idx) + 128]] += mem[(32 * idx) + (32 * _ids.length) + 160]
          idx = idx + 1
          continue 
      mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 192] = 64
      mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 288 len floor32(_ids.length)] = call.data[_ids + 36 len floor32(_ids.length)]
      mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 224] = (32 * _ids.length) + 96
      mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 288] = _values.length
      mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 320 len floor32(_values.length)] = call.data[_values + 36 len floor32(_values.length)]
      log 0x4a39dc06: Mask(8 * -ceil32(_data.length) + _data.length + 32, 0, 0), mem[(32 * _ids.length) + (32 * _values.length) + _data.length + 224 len ceil32(_data.length) + -_data.length + 32], _ids.length, call.data[_ids + 36 len floor32(_ids.length)], mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + floor32(_ids.length) + 288 len (32 * _ids.length) + (32 * _values.length) + -floor32(_ids.length) + 32], caller, _from, _to
  else:
      if stor10[caller]:
          if not _to:
              revert with 0, 
                          32,
                          48,
                          0x4845524331313535237361666542617463685472616e7366657246726f6d3a20494e56414c49445f524543495049454e,
                          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 308 len 16]
          if _ids.length != _values.length:
              revert with 0, 
                          32,
                          53,
                          0x5245524331313535235f7361666542617463685472616e7366657246726f6d3a20494e56414c49445f4152524159535f4c454e4754,
                          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 313 len 11]
          idx = 0
          while idx < _ids.length:
              require idx < _values.length
              require idx < _ids.length
              if mem[(32 * idx) + (32 * _ids.length) + 160] > stor0[addr(_from)][mem[(32 * idx) + 128]]:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              require idx < _ids.length
              stor0[addr(_from)][mem[(32 * idx) + 128]] -= mem[(32 * idx) + (32 * _ids.length) + 160]
              require idx < _values.length
              require idx < _ids.length
              if stor0[addr(_to)][mem[(32 * idx) + 128]] + mem[(32 * idx) + (32 * _ids.length) + 160] < stor0[addr(_to)][mem[(32 * idx) + 128]]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              require idx < _ids.length
              mem[0] = mem[(32 * idx) + 128]
              mem[32] = sha3(addr(_to), 0)
              stor0[addr(_to)][mem[(32 * idx) + 128]] += mem[(32 * idx) + (32 * _ids.length) + 160]
              idx = idx + 1
              continue 
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 192] = 64
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 288 len floor32(_ids.length)] = call.data[_ids + 36 len floor32(_ids.length)]
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 224] = (32 * _ids.length) + 96
          mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 288] = _values.length
          mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 320 len floor32(_values.length)] = call.data[_values + 36 len floor32(_values.length)]
          log 0x4a39dc06: Mask(8 * -ceil32(_data.length) + _data.length + 32, 0, 0), mem[(32 * _ids.length) + (32 * _values.length) + _data.length + 224 len ceil32(_data.length) + -_data.length + 32], _ids.length, call.data[_ids + 36 len floor32(_ids.length)], mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + floor32(_ids.length) + 288 len (32 * _ids.length) + (32 * _values.length) + -floor32(_ids.length) + 32], caller, _from, _to
      else:
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 196] = _from
          require ext_code.size(unknowncd7c0326Address)
          static call unknowncd7c0326Address.proxies(address param1) with:
                  gas gas_remaining wei
                 args _from
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 192] = ext_call.return_data[0]
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if ext_call.return_data[12 len 20] != caller:
              if not stor1[addr(_from)][caller]:
                  revert with 0, 
                              32,
                              47,
                              0x4845524331313535237361666542617463685472616e7366657246726f6d3a20494e56414c49445f4f50455241544f,
                              mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 307 len 17]
          if not _to:
              revert with 0, 
                          32,
                          48,
                          0x4845524331313535237361666542617463685472616e7366657246726f6d3a20494e56414c49445f524543495049454e,
                          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 308 len 16]
          if _ids.length != _values.length:
              revert with 0, 
                          32,
                          53,
                          0x5245524331313535235f7361666542617463685472616e7366657246726f6d3a20494e56414c49445f4152524159535f4c454e4754,
                          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 313 len 11]
          idx = 0
          while idx < _ids.length:
              require idx < _values.length
              require idx < _ids.length
              if mem[(32 * idx) + (32 * _ids.length) + 160] > stor0[addr(_from)][mem[(32 * idx) + 128]]:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              require idx < _ids.length
              stor0[addr(_from)][mem[(32 * idx) + 128]] -= mem[(32 * idx) + (32 * _ids.length) + 160]
              require idx < _values.length
              require idx < _ids.length
              if stor0[addr(_to)][mem[(32 * idx) + 128]] + mem[(32 * idx) + (32 * _ids.length) + 160] < stor0[addr(_to)][mem[(32 * idx) + 128]]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              require idx < _ids.length
              mem[0] = mem[(32 * idx) + 128]
              mem[32] = sha3(addr(_to), 0)
              stor0[addr(_to)][mem[(32 * idx) + 128]] += mem[(32 * idx) + (32 * _ids.length) + 160]
              idx = idx + 1
              continue 
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 288 len floor32(_ids.length)] = call.data[_ids + 36 len floor32(_ids.length)]
          mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 288] = _values.length
          mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 320 len floor32(_values.length)] = call.data[_values + 36 len floor32(_values.length)]
          log 0x4a39dc06: 0, 64, (32 * _ids.length) + 96, _ids.length, call.data[_ids + 36 len floor32(_ids.length)], mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + floor32(_ids.length) + 288 len (32 * _ids.length) + (32 * _values.length) + -floor32(_ids.length) + 32], caller, _from, _to
  if ext_code.hash(_to):
      if ext_code.hash(_to) != 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 192] = 0xbc197c8100000000000000000000000000000000000000000000000000000000
          mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 388 len floor32(_ids.length)] = call.data[_ids + 36 len floor32(_ids.length)]
          mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 388] = _values.length
          mem[(64 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + 420 len floor32(_values.length)] = call.data[_values + 36 len floor32(_values.length)]
          mem[(64 * _values.length) + (64 * _ids.length) + ceil32(_data.length) + 420] = _data.length
          mem[(64 * _values.length) + (64 * _ids.length) + ceil32(_data.length) + 452 len ceil32(_data.length)] = _data[all], mem[(32 * _ids.length) + (32 * _values.length) + _data.length + 192 len ceil32(_data.length) - _data.length]
          if not _data.length % 32:
              require ext_code.size(_to)
              call _to with:
                   gas gas_remaining wei
                  args caller, addr(_from), Array(len=_ids.length, data=call.data[_ids + 36 len floor32(_ids.length)], mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + floor32(_ids.length) + 388 len (32 * _ids.length) + (32 * _values.length) + _data.length + -floor32(_ids.length) + 64]), (32 * _ids.length) + 192, (32 * _values.length) + (32 * _ids.length) + 224
          else:
              mem[floor32(_data.length) + (64 * _values.length) + (64 * _ids.length) + ceil32(_data.length) + 452] = mem[floor32(_data.length) + (64 * _values.length) + (64 * _ids.length) + ceil32(_data.length) + -(_data.length % 32) + 484 len _data.length % 32]
              require ext_code.size(_to)
              call _to with:
                   gas gas_remaining wei
                  args caller, addr(_from), Array(len=_ids.length, data=call.data[_ids + 36 len floor32(_ids.length)], mem[(32 * _ids.length) + (32 * _values.length) + ceil32(_data.length) + floor32(_ids.length) + 388 len (32 * _ids.length) + (32 * _values.length) + floor32(_data.length) + -floor32(_ids.length) + 96]), (32 * _ids.length) + 192, (32 * _values.length) + (32 * _ids.length) + 224
          if not ext_call.success:
              revert with ext_call.return_data[0 len return_data.size]
          require return_data.size >= 32
          if Mask(32, 224, ext_call.return_data[0]) != 0xbc197c8100000000000000000000000000000000000000000000000000000000:
              revert with 0, 
                          32,
                          63,
                          0x5245524331313535235f63616c6c6f6e45524331313535426174636852656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                          uint8((32 * _ids.length) + 192)

def unknownb48ab8b6(addr _param1, array _param2, array _param3, array _param4) payable: 
  require calldata.size - 4 >= 128
  require _param2 <= 4294967296
  require _param2 + 36 <= calldata.size
  require _param2.length <= 4294967296 and _param2 + (32 * _param2.length) + 36 <= calldata.size
  mem[96] = _param2.length
  mem[128 len 32 * _param2.length] = call.data[_param2 + 36 len 32 * _param2.length]
  require _param3 <= 4294967296
  require _param3 + 36 <= calldata.size
  require _param3.length <= 4294967296 and _param3 + (32 * _param3.length) + 36 <= calldata.size
  mem[(32 * _param2.length) + 128] = _param3.length
  mem[(32 * _param2.length) + 160 len 32 * _param3.length] = call.data[_param3 + 36 len 32 * _param3.length]
  require _param4 <= 4294967296
  require _param4 + 36 <= calldata.size
  require _param4.length <= 4294967296 and _param4 + _param4.length + 36 <= calldata.size
  mem[64] = (32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 192
  mem[(32 * _param2.length) + (32 * _param3.length) + 160] = _param4.length
  mem[(32 * _param2.length) + (32 * _param3.length) + 192 len _param4.length] = _param4[all]
  mem[(32 * _param2.length) + (32 * _param3.length) + _param4.length + 192] = 0
  if not stor9:
      revert with 0, 'ReentrancyGuard: reentrant call'
  stor9 = 0
  idx = 0
  while idx < _param2.length:
      require idx < _param2.length
      _240 = mem[(32 * idx) + 128]
      require idx < _param3.length
      _243 = mem[(32 * idx) + (32 * _param2.length) + 160]
      if not creator[mem[(32 * idx) + 128]]:
          if mem[(32 * idx) + 140 len 8] == caller:
              mem[0] = mem[(32 * idx) + 128]
              mem[32] = 6
              if totalSupply[mem[(32 * idx) + 128]] > mem[(32 * idx) + 155 len 5]:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              if mem[(32 * idx) + 155 len 5] - totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + (32 * _param2.length) + 160]:
                  revert with 0, 
                              32,
                              53,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                              mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 313 len 11]
          else:
              if stor10[caller]:
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 6
                  if totalSupply[mem[(32 * idx) + 128]] > mem[(32 * idx) + 155 len 5]:
                      revert with 0, 'SafeMath#sub: UNDERFLOW'
                  if mem[(32 * idx) + 155 len 5] - totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + (32 * _param2.length) + 160]:
                      revert with 0, 
                                  32,
                                  53,
                                  0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 313 len 11]
              else:
                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 196] = mem[(32 * idx) + 140 len 8]
                  require ext_code.size(unknowncd7c0326Address)
                  static call unknowncd7c0326Address.proxies(address param1) with:
                          gas gas_remaining wei
                         args (Mask(64, 96, _240) >> 96)
                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 192] = ext_call.return_data[0]
                  if not ext_call.success:
                      revert with ext_call.return_data[0 len return_data.size]
                  require return_data.size >= 32
                  if addr(ext_call.return_data) != caller:
                      revert with 0, 
                                  32,
                                  58,
                                  0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a204f4e4c595f43524541544f525f414c4c4f5745,
                                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 318 len 6]
                  mem[0] = _240
                  mem[32] = 6
                  if totalSupply[_240] > _240 % 1099511627776:
                      revert with 0, 'SafeMath#sub: UNDERFLOW'
                  if (_240 % 1099511627776) - totalSupply[_240] < _243:
                      revert with 0, 
                                  32,
                                  53,
                                  0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 313 len 11]
      else:
          if creator[mem[(32 * idx) + 128]] == caller:
              mem[0] = mem[(32 * idx) + 128]
              mem[32] = 6
              if totalSupply[mem[(32 * idx) + 128]] > mem[(32 * idx) + 155 len 5]:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              if mem[(32 * idx) + 155 len 5] - totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + (32 * _param2.length) + 160]:
                  revert with 0, 
                              32,
                              53,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                              mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 313 len 11]
          else:
              _246 = sha3(mem[(32 * idx) + 128], 11)
              if stor10[caller]:
                  mem[0] = mem[(32 * idx) + 128]
                  mem[32] = 6
                  if totalSupply[mem[(32 * idx) + 128]] > mem[(32 * idx) + 155 len 5]:
                      revert with 0, 'SafeMath#sub: UNDERFLOW'
                  if mem[(32 * idx) + 155 len 5] - totalSupply[mem[(32 * idx) + 128]] < mem[(32 * idx) + (32 * _param2.length) + 160]:
                      revert with 0, 
                                  32,
                                  53,
                                  0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 313 len 11]
              else:
                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 196] = creator[mem[(32 * idx) + 128]]
                  require ext_code.size(unknowncd7c0326Address)
                  static call unknowncd7c0326Address.proxies(address param1) with:
                          gas gas_remaining wei
                         args addr(stor[_246])
                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 192] = ext_call.return_data[0]
                  if not ext_call.success:
                      revert with ext_call.return_data[0 len return_data.size]
                  require return_data.size >= 32
                  if addr(ext_call.return_data) != caller:
                      revert with 0, 
                                  32,
                                  58,
                                  0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a204f4e4c595f43524541544f525f414c4c4f5745,
                                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 318 len 6]
                  mem[0] = _240
                  mem[32] = 6
                  if totalSupply[_240] > _240 % 1099511627776:
                      revert with 0, 'SafeMath#sub: UNDERFLOW'
                  if (_240 % 1099511627776) - totalSupply[_240] < _243:
                      revert with 0, 
                                  32,
                                  53,
                                  0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 313 len 11]
      idx = idx + 1
      continue 
  if _param2.length != _param3.length:
      revert with 0, 
                  32,
                  48,
                  0x48455243313135355472616461626c652362617463684d696e743a20494e56414c49445f4152524159535f4c454e4754,
                  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 308 len 16]
  require 0 < _param2.length
  idx = 0
  while idx < _param2.length:
      require idx < _param2.length
      if mem[(32 * idx) + 140 len 8] != mem[140 len 8]:
          revert with 0, 
                      32,
                      55,
                      0x52455243313135355472616461626c652362617463684d696e743a204d554c5449504c455f4f524947494e535f4e4f545f414c4c4f5745,
                      mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 315 len 9]
      require idx < _param3.length
      if stor0[addr(_param1)][mem[(32 * idx) + 128]] + mem[(32 * idx) + (32 * _param2.length) + 160] < stor0[addr(_param1)][mem[(32 * idx) + 128]]:
          revert with 0, 'SafeMath#add: OVERFLOW'
      stor0[addr(_param1)][mem[(32 * idx) + 128]] += mem[(32 * idx) + (32 * _param2.length) + 160]
      require idx < _param3.length
      if totalSupply[mem[(32 * idx) + 128]] + mem[(32 * idx) + (32 * _param2.length) + 160] < totalSupply[mem[(32 * idx) + 128]]:
          revert with 0, 'SafeMath#add: OVERFLOW'
      mem[0] = mem[(32 * idx) + 128]
      mem[32] = 6
      totalSupply[mem[(32 * idx) + 128]] += mem[(32 * idx) + (32 * _param2.length) + 160]
      idx = idx + 1
      continue 
  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 192] = 64
  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 256] = _param2.length
  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 288 len floor32(_param2.length)] = call.data[_param2 + 36 len floor32(_param2.length)]
  mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 224] = (32 * _param2.length) + 96
  mem[(64 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 288] = _param3.length
  mem[(64 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 320 len floor32(_param3.length)] = call.data[_param3 + 36 len floor32(_param3.length)]
  log 0x4a39dc06: Array(len=_param2.length, data=call.data[_param2 + 36 len floor32(_param2.length)], mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + floor32(_param2.length) + 288 len (32 * _param2.length) + (32 * _param3.length) + -floor32(_param2.length) + 32]), (32 * _param2.length) + 96, caller, mem1
  if not ext_code.hash(_param1):
      if _param4.length > 1:
          idx = 0
          while idx < _param2.length:
              require idx < mem[96]
              _921 = mem[(32 * idx) + 128]
              mem[32] = 8
              mem[0] = sha3(mem[(32 * idx) + 128], 8)
              uri[mem[(32 * idx) + 128]] = (2 * mem[(32 * _param2.length) + (32 * _param3.length) + 160]) + 1
              t = sha3(sha3(mem[(32 * idx) + 128], 8))
              s = (32 * _param2.length) + (32 * _param3.length) + 192
              while (32 * _param2.length) + (32 * _param3.length) + mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 192 > s:
                  uint256(stor[t]) = mem[s]
                  t = t + 1
                  s = s + 32
                  continue 
              s = sha3(sha3(mem[(32 * idx) + 128], 8)) + (Mask(251, 0, mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 31) >> 5)
              while sha3(sha3(mem[(32 * idx) + 128], 8)) + (uri[mem[(32 * idx) + 128]].length + 31 / 32) > s:
                  uint256(stor[s]) = 0
                  s = s + 1
                  continue 
              _1189 = mem[64]
              mem[mem[64]] = 32
              mem[mem[64] + 32] = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
              _1191 = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
              s = 0
              while s < _1191:
                  mem[_1189 + s + 64] = mem[(32 * _param2.length) + (32 * _param3.length) + s + 192]
                  s = s + 32
                  continue 
              if not _1191 % 32:
                  log 0x6bb7ff70: mem[memem
              else:
                  mem[floor32(_1191) + _1189 + 64] = mem[floor32(_1191) + _1189 + -(_1191 % 32) + 96 len _1191 % 32]
                  log 0x6bb7ff70: mem[memem
              idx = idx + 1
              continue 
  else:
      if ext_code.hash(_param1) == 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
          if _param4.length > 1:
              idx = 0
              while idx < _param2.length:
                  require idx < mem[96]
                  _922 = mem[(32 * idx) + 128]
                  mem[32] = 8
                  mem[0] = sha3(mem[(32 * idx) + 128], 8)
                  uri[mem[(32 * idx) + 128]] = (2 * mem[(32 * _param2.length) + (32 * _param3.length) + 160]) + 1
                  t = sha3(sha3(mem[(32 * idx) + 128], 8))
                  s = (32 * _param2.length) + (32 * _param3.length) + 192
                  while (32 * _param2.length) + (32 * _param3.length) + mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 192 > s:
                      uint256(stor[t]) = mem[s]
                      t = t + 1
                      s = s + 32
                      continue 
                  s = sha3(sha3(mem[(32 * idx) + 128], 8)) + (Mask(251, 0, mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 31) >> 5)
                  while sha3(sha3(mem[(32 * idx) + 128], 8)) + (uri[mem[(32 * idx) + 128]].length + 31 / 32) > s:
                      uint256(stor[s]) = 0
                      s = s + 1
                      continue 
                  _1192 = mem[64]
                  mem[mem[64]] = 32
                  mem[mem[64] + 32] = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
                  _1194 = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
                  s = 0
                  while s < _1194:
                      mem[_1192 + s + 64] = mem[(32 * _param2.length) + (32 * _param3.length) + s + 192]
                      s = s + 32
                      continue 
                  if not _1194 % 32:
                      log 0x6bb7ff70: mem[memem
                  else:
                      mem[floor32(_1194) + _1192 + 64] = mem[floor32(_1194) + _1192 + -(_1194 % 32) + 96 len _1194 % 32]
                      log 0x6bb7ff70: mem[memem
                  idx = idx + 1
                  continue 
      else:
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 192] = 0xbc197c8100000000000000000000000000000000000000000000000000000000
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 196] = caller
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 228] = mem[140 len 8]
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 260] = 160
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 356] = _param2.length
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 388 len floor32(_param2.length)] = call.data[_param2 + 36 len floor32(_param2.length)]
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 292] = (32 * _param2.length) + 192
          mem[(64 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 388] = _param3.length
          mem[(64 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 420 len floor32(_param3.length)] = call.data[_param3 + 36 len floor32(_param3.length)]
          mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 324] = (32 * _param3.length) + (32 * _param2.length) + 224
          mem[(64 * _param3.length) + (64 * _param2.length) + ceil32(_param4.length) + 420] = _param4.length
          mem[(64 * _param3.length) + (64 * _param2.length) + ceil32(_param4.length) + 452 len ceil32(_param4.length)] = _param4[all], mem[(32 * _param2.length) + (32 * _param3.length) + _param4.length + 192 len ceil32(_param4.length) - _param4.length]
          if not _param4.length % 32:
              require ext_code.size(_param1)
              call _param1.0xbc197c81 with:
                   gas gas_remaining wei
                  args caller, mem[140 len 8], Array(len=_param2.length, data=call.data[_param2 + 36 len floor32(_param2.length)], mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + floor32(_param2.length) + 388 len (32 * _param2.length) + (32 * _param3.length) + _param4.length + -floor32(_param2.length) + 64]), (32 * _param2.length) + 192, (32 * _param3.length) + (32 * _param2.length) + 224
              mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 192] = ext_call.return_data[0]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if Mask(32, 224, ext_call.return_data[0]) != 0xbc197c8100000000000000000000000000000000000000000000000000000000:
                  revert with 0, 
                              32,
                              63,
                              0x5245524331313535235f63616c6c6f6e45524331313535426174636852656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                              uint8((32 * _param2.length) + 192)
              if _param4.length > 1:
                  idx = 0
                  while idx < _param2.length:
                      require idx < mem[96]
                      _1281 = mem[(32 * idx) + 128]
                      mem[32] = 8
                      mem[0] = sha3(mem[(32 * idx) + 128], 8)
                      uri[mem[(32 * idx) + 128]] = (2 * mem[(32 * _param2.length) + (32 * _param3.length) + 160]) + 1
                      t = sha3(sha3(mem[(32 * idx) + 128], 8))
                      s = (32 * _param2.length) + (32 * _param3.length) + 192
                      while (32 * _param2.length) + (32 * _param3.length) + mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 192 > s:
                          uint256(stor[t]) = mem[s]
                          t = t + 1
                          s = s + 32
                          continue 
                      s = sha3(sha3(mem[(32 * idx) + 128], 8)) + (Mask(251, 0, mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 31) >> 5)
                      while sha3(sha3(mem[(32 * idx) + 128], 8)) + (uri[mem[(32 * idx) + 128]].length + 31 / 32) > s:
                          uint256(stor[s]) = 0
                          s = s + 1
                          continue 
                      _1397 = mem[64]
                      mem[mem[64]] = 32
                      mem[mem[64] + 32] = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
                      _1399 = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
                      s = 0
                      while s < _1399:
                          mem[_1397 + s + 64] = mem[(32 * _param2.length) + (32 * _param3.length) + s + 192]
                          s = s + 32
                          continue 
                      if not _1399 % 32:
                          log 0x6bb7ff70: mem[memem
                      else:
                          mem[floor32(_1399) + _1397 + 64] = mem[floor32(_1399) + _1397 + -(_1399 % 32) + 96 len _1399 % 32]
                          log 0x6bb7ff70: mem[memem
                      idx = idx + 1
                      continue 
          else:
              mem[floor32(_param4.length) + (64 * _param3.length) + (64 * _param2.length) + ceil32(_param4.length) + 452] = mem[floor32(_param4.length) + (64 * _param3.length) + (64 * _param2.length) + ceil32(_param4.length) + -(_param4.length % 32) + 484 len _param4.length % 32]
              require ext_code.size(_param1)
              call _param1.0xbc197c81 with:
                   gas gas_remaining wei
                  args caller, mem[140 len 8], Array(len=_param2.length, data=call.data[_param2 + 36 len floor32(_param2.length)], mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + floor32(_param2.length) + 388 len (32 * _param2.length) + (32 * _param3.length) + floor32(_param4.length) + -floor32(_param2.length) + 96]), (32 * _param2.length) + 192, (32 * _param3.length) + (32 * _param2.length) + 224
              mem[(32 * _param2.length) + (32 * _param3.length) + ceil32(_param4.length) + 192] = ext_call.return_data[0]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if Mask(32, 224, ext_call.return_data[0]) != 0xbc197c8100000000000000000000000000000000000000000000000000000000:
                  revert with 0, 
                              32,
                              63,
                              0x5245524331313535235f63616c6c6f6e45524331313535426174636852656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                              uint8((32 * _param2.length) + 192)
              if _param4.length > 1:
                  idx = 0
                  while idx < _param2.length:
                      require idx < mem[96]
                      _1282 = mem[(32 * idx) + 128]
                      mem[32] = 8
                      mem[0] = sha3(mem[(32 * idx) + 128], 8)
                      uri[mem[(32 * idx) + 128]] = (2 * mem[(32 * _param2.length) + (32 * _param3.length) + 160]) + 1
                      t = sha3(sha3(mem[(32 * idx) + 128], 8))
                      s = (32 * _param2.length) + (32 * _param3.length) + 192
                      while (32 * _param2.length) + (32 * _param3.length) + mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 192 > s:
                          uint256(stor[t]) = mem[s]
                          t = t + 1
                          s = s + 32
                          continue 
                      s = sha3(sha3(mem[(32 * idx) + 128], 8)) + (Mask(251, 0, mem[(32 * _param2.length) + (32 * _param3.length) + 160] + 31) >> 5)
                      while sha3(sha3(mem[(32 * idx) + 128], 8)) + (uri[mem[(32 * idx) + 128]].length + 31 / 32) > s:
                          uint256(stor[s]) = 0
                          s = s + 1
                          continue 
                      _1400 = mem[64]
                      mem[mem[64]] = 32
                      mem[mem[64] + 32] = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
                      _1402 = mem[(32 * _param2.length) + (32 * _param3.length) + 160]
                      s = 0
                      while s < _1402:
                          mem[_1400 + s + 64] = mem[(32 * _param2.length) + (32 * _param3.length) + s + 192]
                          s = s + 32
                          continue 
                      if not _1402 % 32:
                          log 0x6bb7ff70: mem[memem
                      else:
                          mem[floor32(_1402) + _1400 + 64] = mem[floor32(_1402) + _1400 + -(_1402 % 32) + 96 len _1402 % 32]
                          log 0x6bb7ff70: mem[memem
                      idx = idx + 1
                      continue 
  stor9 = 1

def unknown731133e9(addr _param1, uint256 _param2, uint256 _param3, array _param4) payable: 
  require calldata.size - 4 >= 128
  require _param4 <= 4294967296
  require _param4 + 36 <= calldata.size
  require _param4.length <= 4294967296 and _param4 + _param4.length + 36 <= calldata.size
  mem[128 len _param4.length] = _param4[all]
  mem[_param4.length + 128] = 0
  if not stor9:
      revert with 0, 'ReentrancyGuard: reentrant call'
  stor9 = 0
  if not creator[_param2]:
      if uint64(_param2) == caller:
          if totalSupply[_param2] > _param2 % 1099511627776:
              revert with 0, 'SafeMath#sub: UNDERFLOW'
          if (_param2 % 1099511627776) - totalSupply[_param2] < _param3:
              revert with 0, 
                          32,
                          53,
                          0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                          mem[ceil32(_param4.length) + 249 len 11]
          if stor0[addr(_param1)][_param2] + _param3 < stor0[addr(_param1)][_param2]:
              revert with 0, 'SafeMath#add: OVERFLOW'
          stor0[addr(_param1)][_param2] += _param3
          if totalSupply[_param2] + _param3 < totalSupply[_param2]:
              revert with 0, 'SafeMath#add: OVERFLOW'
          totalSupply[_param2] += _param3
          mem[ceil32(_param4.length) + 128] = _param2
          mem[ceil32(_param4.length) + 160] = _param3
          log 0xc3d58168: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len -_param4.length + ceil32(_param4.length) + 32], caller, uint64(_param2), _param1
          if not ext_code.hash(_param1):
              if _param4.length > 1:
                  uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                  mem[ceil32(_param4.length) + 128] = 32
                  mem[ceil32(_param4.length) + 160] = _param4.length
                  mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                  if not _param4.length % 32:
                      log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                  else:
                      mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                      log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
          else:
              if ext_code.hash(_param1) == 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
                  if _param4.length > 1:
                      uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                      mem[ceil32(_param4.length) + 128] = 32
                      mem[ceil32(_param4.length) + 160] = _param4.length
                      mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      if not _param4.length % 32:
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                      else:
                          mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
              else:
                  mem[ceil32(_param4.length) + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
                  mem[ceil32(_param4.length) + 196] = _param2
                  mem[ceil32(_param4.length) + 228] = _param3
                  mem[ceil32(_param4.length) + 260] = 160
                  mem[ceil32(_param4.length) + 292] = _param4.length
                  mem[ceil32(_param4.length) + 324 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                  require ext_code.size(_param1)
                  call _param1 with:
                       gas gas_remaining wei
                      args caller, _param2 << 192, _param2, _param3, Array(len=_param4.length, data=_param4[all])
                  if not ext_call.success:
                      revert with ext_call.return_data[0 len return_data.size]
                  require return_data.size >= 32
                  if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
                      revert with 0, 
                                  32,
                                  58,
                                  0x4545524331313535235f63616c6c6f6e4552433131353552656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                                  _param3 % 281474976710656
                  if _param4.length > 1:
                      uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                      mem[ceil32(_param4.length) + 128] = 32
                      mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      if not _param4.length % 32:
                          log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                      else:
                          mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                          log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
      else:
          if stor10[caller]:
              if totalSupply[_param2] > _param2 % 1099511627776:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              if (_param2 % 1099511627776) - totalSupply[_param2] < _param3:
                  revert with 0, 
                              32,
                              53,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                              mem[ceil32(_param4.length) + 249 len 11]
              if stor0[addr(_param1)][_param2] + _param3 < stor0[addr(_param1)][_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              stor0[addr(_param1)][_param2] += _param3
              if totalSupply[_param2] + _param3 < totalSupply[_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              totalSupply[_param2] += _param3
              mem[ceil32(_param4.length) + 128] = _param2
              mem[ceil32(_param4.length) + 160] = _param3
              log 0xc3d58168: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len -_param4.length + ceil32(_param4.length) + 32], caller, uint64(_param2), _param1
              if not ext_code.hash(_param1):
                  if _param4.length > 1:
                      uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                      mem[ceil32(_param4.length) + 128] = 32
                      mem[ceil32(_param4.length) + 160] = _param4.length
                      mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      if not _param4.length % 32:
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                      else:
                          mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
              else:
                  if ext_code.hash(_param1) == 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
                      if _param4.length > 1:
                          uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                          mem[ceil32(_param4.length) + 128] = 32
                          mem[ceil32(_param4.length) + 160] = _param4.length
                          mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                          if not _param4.length % 32:
                              log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                          else:
                              mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                              log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
                  else:
                      mem[ceil32(_param4.length) + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
                      mem[ceil32(_param4.length) + 196] = _param2
                      mem[ceil32(_param4.length) + 228] = _param3
                      mem[ceil32(_param4.length) + 260] = 160
                      mem[ceil32(_param4.length) + 292] = _param4.length
                      mem[ceil32(_param4.length) + 324 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      require ext_code.size(_param1)
                      call _param1 with:
                           gas gas_remaining wei
                          args caller, _param2 << 192, _param2, _param3, Array(len=_param4.length, data=_param4[all])
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >= 32
                      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
                          revert with 0, 
                                      32,
                                      58,
                                      0x4545524331313535235f63616c6c6f6e4552433131353552656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                                      _param3 % 281474976710656
                      if _param4.length > 1:
                          uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                          mem[ceil32(_param4.length) + 128] = 32
                          mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                          if not _param4.length % 32:
                              log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                          else:
                              mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                              log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
          else:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args uint64(_param2)
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data[12 len 20] != caller:
                  revert with 0, 
                              32,
                              58,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a204f4e4c595f43524541544f525f414c4c4f5745,
                              mem[ceil32(_param4.length) + 254 len 6]
              if totalSupply[_param2] > _param2 % 1099511627776:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              if (_param2 % 1099511627776) - totalSupply[_param2] < _param3:
                  revert with 0, 
                              32,
                              53,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                              mem[ceil32(_param4.length) + 249 len 11]
              if stor0[addr(_param1)][_param2] + _param3 < stor0[addr(_param1)][_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              stor0[addr(_param1)][_param2] += _param3
              if totalSupply[_param2] + _param3 < totalSupply[_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              totalSupply[_param2] += _param3
              log 0xc3d58168: 0, Mask(224, 0, _param2), _param3, caller, uint64(_param2), _param1
              if ext_code.hash(_param1):
                  if ext_code.hash(_param1) != 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
                      mem[ceil32(_param4.length) + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
                      mem[ceil32(_param4.length) + 196] = _param2
                      mem[ceil32(_param4.length) + 228] = _param3
                      mem[ceil32(_param4.length) + 260] = 160
                      mem[ceil32(_param4.length) + 292] = _param4.length
                      mem[ceil32(_param4.length) + 324 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      require ext_code.size(_param1)
                      call _param1 with:
                           gas gas_remaining wei
                          args caller, _param2 << 192, _param2, _param3, Array(len=_param4.length, data=_param4[all])
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >= 32
                      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
                          revert with 0, 
                                      32,
                                      58,
                                      0x4545524331313535235f63616c6c6f6e4552433131353552656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                                      _param3 % 281474976710656
              if _param4.length > 1:
                  uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                  mem[ceil32(_param4.length) + 128] = 32
                  mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                  if not _param4.length % 32:
                      log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                  else:
                      mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                      log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
  else:
      if creator[_param2] == caller:
          if totalSupply[_param2] > _param2 % 1099511627776:
              revert with 0, 'SafeMath#sub: UNDERFLOW'
          if (_param2 % 1099511627776) - totalSupply[_param2] < _param3:
              revert with 0, 
                          32,
                          53,
                          0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                          mem[ceil32(_param4.length) + 249 len 11]
          if stor0[addr(_param1)][_param2] + _param3 < stor0[addr(_param1)][_param2]:
              revert with 0, 'SafeMath#add: OVERFLOW'
          stor0[addr(_param1)][_param2] += _param3
          if totalSupply[_param2] + _param3 < totalSupply[_param2]:
              revert with 0, 'SafeMath#add: OVERFLOW'
          totalSupply[_param2] += _param3
          mem[ceil32(_param4.length) + 128] = _param2
          mem[ceil32(_param4.length) + 160] = _param3
          log 0xc3d58168: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len -_param4.length + ceil32(_param4.length) + 32], caller, uint64(_param2), _param1
          if not ext_code.hash(_param1):
              if _param4.length > 1:
                  uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                  mem[ceil32(_param4.length) + 128] = 32
                  mem[ceil32(_param4.length) + 160] = _param4.length
                  mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                  if not _param4.length % 32:
                      log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                  else:
                      mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                      log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
          else:
              if ext_code.hash(_param1) == 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
                  if _param4.length > 1:
                      uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                      mem[ceil32(_param4.length) + 128] = 32
                      mem[ceil32(_param4.length) + 160] = _param4.length
                      mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      if not _param4.length % 32:
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                      else:
                          mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
              else:
                  mem[ceil32(_param4.length) + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
                  mem[ceil32(_param4.length) + 196] = _param2
                  mem[ceil32(_param4.length) + 228] = _param3
                  mem[ceil32(_param4.length) + 260] = 160
                  mem[ceil32(_param4.length) + 292] = _param4.length
                  mem[ceil32(_param4.length) + 324 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                  require ext_code.size(_param1)
                  call _param1 with:
                       gas gas_remaining wei
                      args caller, _param2 << 192, _param2, _param3, Array(len=_param4.length, data=_param4[all])
                  if not ext_call.success:
                      revert with ext_call.return_data[0 len return_data.size]
                  require return_data.size >= 32
                  if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
                      revert with 0, 
                                  32,
                                  58,
                                  0x4545524331313535235f63616c6c6f6e4552433131353552656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                                  _param3 % 281474976710656
                  if _param4.length > 1:
                      uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                      mem[ceil32(_param4.length) + 128] = 32
                      mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      if not _param4.length % 32:
                          log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                      else:
                          mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                          log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
      else:
          if stor10[caller]:
              if totalSupply[_param2] > _param2 % 1099511627776:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              if (_param2 % 1099511627776) - totalSupply[_param2] < _param3:
                  revert with 0, 
                              32,
                              53,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                              mem[ceil32(_param4.length) + 249 len 11]
              if stor0[addr(_param1)][_param2] + _param3 < stor0[addr(_param1)][_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              stor0[addr(_param1)][_param2] += _param3
              if totalSupply[_param2] + _param3 < totalSupply[_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              totalSupply[_param2] += _param3
              mem[ceil32(_param4.length) + 128] = _param2
              mem[ceil32(_param4.length) + 160] = _param3
              log 0xc3d58168: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len -_param4.length + ceil32(_param4.length) + 32], caller, uint64(_param2), _param1
              if not ext_code.hash(_param1):
                  if _param4.length > 1:
                      uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                      mem[ceil32(_param4.length) + 128] = 32
                      mem[ceil32(_param4.length) + 160] = _param4.length
                      mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      if not _param4.length % 32:
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                      else:
                          mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                          log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
              else:
                  if ext_code.hash(_param1) == 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
                      if _param4.length > 1:
                          uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                          mem[ceil32(_param4.length) + 128] = 32
                          mem[ceil32(_param4.length) + 160] = _param4.length
                          mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                          if not _param4.length % 32:
                              log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                          else:
                              mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                              log 0x6bb7ff70: Mask(8 * -ceil32(_param4.length) + _param4.length + 32, 0, 0), mem[_param4.length + 160 len ceil32(_param4.length) + -_param4.length + 32], Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
                  else:
                      mem[ceil32(_param4.length) + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
                      mem[ceil32(_param4.length) + 196] = _param2
                      mem[ceil32(_param4.length) + 228] = _param3
                      mem[ceil32(_param4.length) + 260] = 160
                      mem[ceil32(_param4.length) + 292] = _param4.length
                      mem[ceil32(_param4.length) + 324 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      require ext_code.size(_param1)
                      call _param1 with:
                           gas gas_remaining wei
                          args caller, _param2 << 192, _param2, _param3, Array(len=_param4.length, data=_param4[all])
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >= 32
                      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
                          revert with 0, 
                                      32,
                                      58,
                                      0x4545524331313535235f63616c6c6f6e4552433131353552656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                                      _param3 % 281474976710656
                      if _param4.length > 1:
                          uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                          mem[ceil32(_param4.length) + 128] = 32
                          mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                          if not _param4.length % 32:
                              log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                          else:
                              mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                              log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
          else:
              require ext_code.size(unknowncd7c0326Address)
              static call unknowncd7c0326Address.proxies(address param1) with:
                      gas gas_remaining wei
                     args creator[_param2]
              if not ext_call.success:
                  revert with ext_call.return_data[0 len return_data.size]
              require return_data.size >= 32
              if ext_call.return_data[12 len 20] != caller:
                  revert with 0, 
                              32,
                              58,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a204f4e4c595f43524541544f525f414c4c4f5745,
                              mem[ceil32(_param4.length) + 254 len 6]
              if totalSupply[_param2] > _param2 % 1099511627776:
                  revert with 0, 'SafeMath#sub: UNDERFLOW'
              if (_param2 % 1099511627776) - totalSupply[_param2] < _param3:
                  revert with 0, 
                              32,
                              53,
                              0x444173736574436f6e7472616374536861726564235f726571756972654d696e7461626c653a20535550504c595f45584345454445,
                              mem[ceil32(_param4.length) + 249 len 11]
              if stor0[addr(_param1)][_param2] + _param3 < stor0[addr(_param1)][_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              stor0[addr(_param1)][_param2] += _param3
              if totalSupply[_param2] + _param3 < totalSupply[_param2]:
                  revert with 0, 'SafeMath#add: OVERFLOW'
              totalSupply[_param2] += _param3
              log 0xc3d58168: 0, Mask(224, 0, _param2), _param3, caller, uint64(_param2), _param1
              if ext_code.hash(_param1):
                  if ext_code.hash(_param1) != 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470:
                      mem[ceil32(_param4.length) + 128] = 0xf23a6e6100000000000000000000000000000000000000000000000000000000
                      mem[ceil32(_param4.length) + 196] = _param2
                      mem[ceil32(_param4.length) + 228] = _param3
                      mem[ceil32(_param4.length) + 260] = 160
                      mem[ceil32(_param4.length) + 292] = _param4.length
                      mem[ceil32(_param4.length) + 324 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                      require ext_code.size(_param1)
                      call _param1 with:
                           gas gas_remaining wei
                          args caller, _param2 << 192, _param2, _param3, Array(len=_param4.length, data=_param4[all])
                      if not ext_call.success:
                          revert with ext_call.return_data[0 len return_data.size]
                      require return_data.size >= 32
                      if Mask(32, 224, ext_call.return_data[0]) != 0xf23a6e6100000000000000000000000000000000000000000000000000000000:
                          revert with 0, 
                                      32,
                                      58,
                                      0x4545524331313535235f63616c6c6f6e4552433131353552656365697665643a20494e56414c49445f4f4e5f524543454956455f4d4553534147,
                                      _param3 % 281474976710656
              if _param4.length > 1:
                  uri[_param2][] = Array(len=_param4.length, data=_param4[all])
                  mem[ceil32(_param4.length) + 128] = 32
                  mem[ceil32(_param4.length) + 192 len ceil32(_param4.length)] = _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]
                  if not _param4.length % 32:
                      log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * _param4.length, -(8 * _param4.length) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * _param4.length) - 256, _param2
                  else:
                      mem[floor32(_param4.length) + ceil32(_param4.length) + 192] = mem[floor32(_param4.length) + ceil32(_param4.length) + -(_param4.length % 32) + 224 len _param4.length % 32]
                      log 0x6bb7ff70: 0, 32, _param4.length, Mask(8 * ceil32(_param4.length), -(8 * ceil32(_param4.length)) + 256, _param4[all], mem[_param4.length + 128 len ceil32(_param4.length) - _param4.length]) << (8 * ceil32(_param4.length)) - 256, mem[(2 * ceil32(_param4.length)) + 192 len floor32(_param4.length) + -ceil32(_param4.length) + 32], _param2
  stor9 = 1

