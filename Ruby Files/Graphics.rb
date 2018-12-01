class Graphics

  def initialize
    @edge = "+-----------------------------------------------------------------------+\n"
    @empty = "|\t\t\t\t\t\t\t\t\t|\n"
    @mocknequi = "MOCK NEQUI".center(71)
    @exitstring = "Enter 0 to exit".rjust(63)
    @signoutstring = "Enter 0 to sign out.".rjust(63)
    @returnstring = "Press enter to return to main menu.".rjust(63)
  end
end
