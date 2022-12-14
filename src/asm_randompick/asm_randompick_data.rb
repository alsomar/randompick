#Please see the loader file for information on the license and author info.
module ASM_Extensions
  module RandomPick

    # Define a method to run when the menu item is clicked
    def self.apply_random_pick
      # Get the current model
      model = Sketchup.active_model
      # Get the selection set
      selection = model.selection
      # Check if the selection is empty
      if selection.empty?
        UI.messagebox("Please select at least one group or component to proceed.")
        return
      end
      # Ask the user for the percentage of components to select
      input = UI.inputbox(["Keep selected (%): "], ["100"], "Random Pick")
      # Check if the inputbox method returned false
      if !input
        # The user clicked the "Cancel" button, so display a message and return
        UI.messagebox("Operation cancelled.")
        return
      end
      # Get the percentage value from the input array
      percent = input[0].to_f
      # Check if the percentage is greater than 100
      if percent > 100
        UI.messagebox("Please enter a percentage value that is less than or equal to 100.")
        return
      end
      # Create an array to store the selected entities
      selected_entities = []
      # Iterate over the selection set
      selection.each do |entity|
        # Check if the entity is a group or component
        if entity.is_a?(Sketchup::Group) || entity.is_a?(Sketchup::ComponentInstance)
          # Add the entity to the array
          selected_entities << entity
        end
      end
      # Check if there are no selected groups or components
      if selected_entities.empty?
        UI.messagebox("No groups or components were selected.")
        return
      end
      # Calculate the number of components to select
      num_to_select = (selected_entities.length * percent / 100.0).round
      # Check if the number of components to select is negative
      if num_to_select <= 0
        # Set the number of components to select to zero, or display an error message and return
        num_to_select = 0
        # UI.messagebox("Error: Cannot select a negative number of groups or components.")
        # return
      end
      # Choose the specified number of random groups or components from the array
      random_entities = selected_entities.sample(num_to_select)
      # Clear the selection set
      model.selection.clear
      # Add the random groups or components to the selection set
      random_entities.each { |entity| model.selection.add(entity) }
      # Display a message with the number of selected groups or components
      if random_entities.empty?
        UI.messagebox("No groups or components were selected.")
      else
        UI.messagebox("#{random_entities.length} groups and/or components were selected.")
      end
    end

  end # module RandomPick
end # module ASM_Extensions
