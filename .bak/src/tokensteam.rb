class TokenSteam
  def initialize(tokens)
    @alltokens = tokens
    @nowtoken = 0
  end
  def getToken
    return @alltokens
  end
  def getNowToken
    return @alltokens[@nowtoken][0]
  end
  def getNextToken
    @nowtoken+=1
    return @alltokens[@nowtoken][0]
  end
  def changeTokenIndex(ind)
    @nowtoken=ind
    return @alltokens[@nowtoken][0]
  end
  def backChangeToken(i)
    @nowtoken-=i
    return @alltokens[@nowtoken][0]
  end
  def forwardChangeToken(i)
    @nowtoken+=i
    return @alltokens[@nowtoken][0]
  end
  def getNowVal(i)
    return @alltokens[@nowtoken][1]
  end
end
