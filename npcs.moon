
flatten = (out={}, list, ...) ->
  if list
    for item in *list
      table.insert out, item

    flatten out, ...
  else
    out

{
  dude: {
    label: "Alula"
    state: {}
    body_balls: =>
      eye_direction = @smooth_facing
      eye_pos = eye_direction * 3

      {
        {0,0,0,  4, WHITE}
        {0,-4,0, 4, WHITE}

        {eye_pos[1], -5, eye_pos[2], 2, BLACK} -- eye
      }
  }

  dude2: {
    label: "Billy B."
    body_balls: =>
      facing = @smooth_facing
      joint_l = facing\cross! * 3
      joint_r = joint_l * -1

      eye_l = joint_l + facing*2
      eye_r = joint_r + facing*2

      {
        {0,0,0, 4, WHITE}
        {joint_l[1], -4, joint_l[2], 4, WHITE}
        {joint_r[1], -4, joint_r[2], 4, WHITE}

        {eye_l[1], -4, eye_l[2], 1.5, BLACK}
        {eye_r[1], -4, eye_r[2], 1.5, BLACK}
      }
  }

  stranger: {
    label: "Turble"
    look_radius: math.pi / 3

    body_balls: =>
      facing = @smooth_facing
      t = @time + @time_offset
      body_height = -2
      head_height = -4
      torso_len = 3

      front = facing * torso_len
      rear = facing * -torso_len

      joint_dir = facing\cross!

      leg_fl = front*1.1 + joint_dir * 2
      leg_fr = front*1.1 + joint_dir * -2

      leg_rl = rear*1.1 + joint_dir * 2
      leg_rr = rear*1.1 + joint_dir * -2

      head = front*1.1
      tail = rear*1.1

      {
        -- torso
        { front[1], body_height, front[2], 3, WHITE }
        { 0, body_height, 0, 3, WHITE }
        { rear[1], body_height, rear[2], 3, WHITE }

        -- legs
        {leg_fl[1], 0, leg_fl[2], 2, WHITE}
        {leg_fr[1], 0, leg_fr[2], 2, WHITE}

        {leg_rl[1], 0, leg_rl[2], 2, WHITE}
        {leg_rr[1], 0, leg_rr[2], 2, WHITE}

        -- rest
        {head[1], head_height, head[2], 2, BLACK}

        {rear[1]*0.3, head_height + math.sin(t), rear[2]*0.3, 4, WHITE}

        {rear[1]*1.8, body_height, rear[2]*1.8, 2, WHITE}

      }

  }

  talldude: {
    label: "Zoosma"
    body_balls: =>
      facing = @smooth_facing
      t = @time + @time_offset
      arm_height = -5
      arm_reach = 6

      wobble_axis = facing\cross!

      base_balls = for y=0,9,3
        wobble = math.sin(y + t*4) * 1
        w = wobble * wobble_axis

        {w[1], -y, w[2], 4, WHITE}

      arms = for d=-1,1,2
        pos = wobble_axis * arm_reach * d
        {pos[1], arm_height + math.sin(t*5*d), pos[2], 3, WHITE}

      eye_left = (wobble_axis + facing*4)\rotate math.pi / 8
      eye_right = (-1 * wobble_axis + facing*4)\rotate -math.pi / 8
      eye_center = (facing*4)

      eyes = {
        {eye_left[1], -9, eye_left[2], 1, BLACK}
        {eye_right[1], -9, eye_right[2], 1, BLACK}
        {eye_center[1], -7, eye_center[2], 1, BLACK}
      }

      flatten base_balls, arms, eyes
  }


}
