import chisel3._

class Multiplier32 extends Module {
  val io = IO(new Bundle {
    val operandA = Input(UInt(32.W))
    val operandB = Input(UInt(32.W))
    val result   = Output(UInt(64.W)) // 32-bit * 32-bit can result in a 64-bit product
  })

  io.result := io.operandA * io.operandB
}

object Multiplier32Main extends App {
  chisel3.Driver.execute(args, () => new Multiplier32)
}
