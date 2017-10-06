require "spec_helper"

RSpec.describe ProcSource do
  context "-> pattern" do
    it "test case 001" do
      proc1 = -> { "hi" }
      expect =<<-EXPECT.chomp
              -> { "hi" }
      EXPECT

      expect(proc1.proc_source).to eq(expect)
    end

    it "test case 002" do
      result = (-> { "hi" }).proc_source
      expect =<<-EXPECT.chomp
                -> { "hi" }
      EXPECT

      expect(result).to eq(expect)
    end
  end

  context "Proc.new pattern" do
    it "test case 001" do
      proc1 = Proc.new do
        "hi"
      end
      expect =<<-EXPECT.chomp
              Proc.new do
        "hi"
      end
      EXPECT

      expect(proc1.proc_source).to eq(expect)
    end

    it "test case 002" do
      proc1 = Proc.new {
        "hi"
      }
      expect =<<-EXPECT.chomp
              Proc.new {
        "hi"
      }
      EXPECT

      expect(proc1.proc_source).to eq(expect)
    end

    it "test case 003" do
      proc1 = Proc.new { "hi" }
      expect =<<-EXPECT.chomp
              Proc.new { "hi" }
      EXPECT

      expect(proc1.proc_source).to eq(expect)
    end
  end

  context "lambda pattern" do
    it "test case 001" do
      lambda1 = lambda { "hi" }
      expect =<<-EXPECT.chomp
                lambda { "hi" }
      EXPECT

      expect(lambda1.proc_source).to eq(expect)
    end

    it "test case 002" do
      lambda1 = lambda do
        "hi"
      end
      expect =<<-EXPECT.chomp
                lambda do
        "hi"
      end
      EXPECT

      expect(lambda1.proc_source).to eq(expect)
    end
  end

  context "&block pattern" do
    it "test case 001" do
      def catch_block(&block)
        block.proc_source
      end

      result = catch_block do
        "hi"
      end
      expect =<<-EXPECT.chomp
                           do
        "hi"
      end
      EXPECT

      expect(result).to eq(expect)
    end

    it "test case 002" do
      def catch_block(&block)
        block.proc_source
      end

      result = catch_block {
        "hi"
      }
      expect =<<-EXPECT.chomp
                           {
        "hi"
      }
      EXPECT

      expect(result).to eq(expect)
    end
  end

  context "corner case" do
    xit "test case 001" do
      lambda1 = eval('lambda { "hi" }')
      expect =<<-EXPECT.chomp
                eval('lambda { "hi" }')
      EXPECT

      expect(lambda1.proc_source).to eq(expect)
    end

    xit "test case 002" do
      proc1, proc2 = Proc.new { "hi" }, Proc.new { "hey" }
      expect1 =<<-EXPECT.chomp
                     Proc.new { "hi" }
      EXPECT
      expect2 =<<-EXPECT.chomp
                                        Proc.new { "hey" }
      EXPECT

      expect(proc1.proc_source).to eq(expect1)
      expect(proc2.proc_source).to eq(expect2)
    end
  end
end
