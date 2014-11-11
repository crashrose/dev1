module NestedFormHelper
  def setup_stat_line_entry(competition)
    # stat_line_entry.stat_line_entry_unit ||= StatLineEntryUnit.new
    competition.stat_line_entry.build
  end

  def setup_stat_line_entry_unit(stat_line_entry)
    # stat_line_entry.stat_line_entry_unit ||= StatLineEntryUnit.new
    # stat_line_entry
    stat_line_entry.stat_line_entry_unit.build
  end

  # def setup_stat_line_entry(stat_line_entry)
  #   stat_line_entry.stat_line_entry_unit ||= StatLineEntryUnit.new
  #   stat_line_entry
  # end
end