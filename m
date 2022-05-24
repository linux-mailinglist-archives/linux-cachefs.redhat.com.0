Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 84050532F4A
	for <lists+linux-cachefs@lfdr.de>; Tue, 24 May 2022 18:56:19 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-d-KzMQqxPaadYBm8leOmiA-1; Tue, 24 May 2022 12:56:10 -0400
X-MC-Unique: d-KzMQqxPaadYBm8leOmiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D574F395AFEA;
	Tue, 24 May 2022 16:56:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FAA340E6A42;
	Tue, 24 May 2022 16:56:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8145193220B;
	Tue, 24 May 2022 16:56:07 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 03C48194704A for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 24 May 2022 06:35:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9A8C1400E73; Tue, 24 May 2022 06:35:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5A931402406
 for <linux-cachefs@redhat.com>; Tue, 24 May 2022 06:35:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDDBB3C025C4
 for <linux-cachefs@redhat.com>; Tue, 24 May 2022 06:35:23 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-CRWZ4p4vOTW7Rdc1JRJH9g-1; Tue, 24 May 2022 02:35:19 -0400
X-MC-Unique: CRWZ4p4vOTW7Rdc1JRJH9g-1
Received: by mail-il1-f198.google.com with SMTP id
 r13-20020a056e0219cd00b002d1bc061d8eso1776723ill.19
 for <linux-cachefs@redhat.com>; Mon, 23 May 2022 23:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=DGNgBhDVvfVzkkpumuUcvhk3jujMVq/Vlb0VD5wROTY=;
 b=bU/F4BCdaWis43FI8j+54OQLmqCZvCWwywItqOWenl5vXOg1DXnqDgJWqFUn9ODpsB
 T351A9Hqil7gUGtGaZdSir/tVPFNBXuSPNCIlZxXaWvyU/8MUk4xi1MX13SNcK+QHaz9
 bwf7E/fkmoWcZaidQ/srYsVpAIjmZpKqKJkk8R7C5ejgNDDT58c2C1gMyF/9ErG8B+Si
 m1Cv130p+iYwPjaVjz3sq4/mQ+cac34jQM8Q2n/0njmdzhe+KGUjbimrVDwKSKAFKIRR
 h1dxxHWbILeMF3f/7CpUnduYkad1VfrVXlx1DI8A6vNbboKELr4wHdTeASE67mj88WE8
 E2VQ==
X-Gm-Message-State: AOAM531fYqqA6k8o+tXfDTJPBpvF7iB8HgKO9o8FxT5zI+DSTq+bBwU1
 HdurpHI1Hx8sf3buHl1P7cqo9zqubHIauHMggOigJW6HUBNX
X-Google-Smtp-Source: ABdhPJz9jKc5B0fN3K2if16xt2dQ2Wv0MuuN8mkQ52nXImUEjSA8a10iEFBmgnFvP+SExuoujifo860YZVSLf2vJ9ElAc72uA4NZ
MIME-Version: 1.0
X-Received: by 2002:a92:c54a:0:b0:2d1:c33a:c72e with SMTP id
 a10-20020a92c54a000000b002d1c33ac72emr1028140ilj.323.1653374119077; Mon, 23
 May 2022 23:35:19 -0700 (PDT)
Date: Mon, 23 May 2022 23:35:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000c6f9e05dfbc294e@google.com>
From: syzbot <syzbot+544cd0e72903f79d599d@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mailman-Approved-At: Tue, 24 May 2022 16:56:07 +0000
Subject: [Linux-cachefs] [syzbot] kernel BUG in __fscache_relinquish_cookie
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

syzbot found the following issue on:

HEAD commit:    b015dcd62b86 Merge tag 'for-5.18/parisc-4' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a4dccef00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=edaa7ad763884c40
dashboard link: https://syzkaller.appspot.com/bug?extid=544cd0e72903f79d599d
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+544cd0e72903f79d599d@syzkaller.appspotmail.com

FS-Cache: 1 == 0 is false
------------[ cut here ]------------
kernel BUG at fs/fscache/cookie.c:957!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 2 PID: 3705 Comm: syz-executor.3 Not tainted 5.18.0-rc7-syzkaller-00119-gb015dcd62b86 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:__fscache_relinquish_cookie.cold+0xee/0x107 fs/fscache/cookie.c:957
Code: c1 ea 03 0f b6 14 02 4c 89 e8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 14 48 63 75 04 31 d2 48 c7 c7 40 cc df 89 e8 57 99 fc ff <0f> 0b 4c 89 ef e8 24 12 97 f8 eb e2 48 89 ef e8 1a 12 97 f8 e9 72
RSP: 0000:ffffc90002f17b90 EFLAGS: 00010282
RAX: 0000000000000019 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff888042fde1c0 RSI: ffffffff815f4a18 RDI: fffff520005e2f64
RBP: ffff888069794040 R08: 0000000000000019 R09: 0000000000000001
R10: ffffffff815ef3ee R11: 0000000000000000 R12: ffff888069794130
R13: ffff888069794044 R14: ffff88807894aab0 R15: ffff88801d84aa00
FS:  000055555661b400(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000451437 CR3: 00000000654f7000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 fscache_relinquish_cookie include/linux/fscache.h:306 [inline]
 v9fs_evict_inode+0x1b1/0x2b0 fs/9p/vfs_inode.c:399
 evict+0x2ed/0x6b0 fs/inode.c:664
 dispose_list+0x117/0x1e0 fs/inode.c:697
 evict_inodes+0x350/0x450 fs/inode.c:747
 generic_shutdown_super+0xab/0x400 fs/super.c:451
 kill_anon_super+0x36/0x60 fs/super.c:1056
 v9fs_kill_super+0x39/0x90 fs/9p/vfs_super.c:223
 deactivate_locked_super+0x94/0x160 fs/super.c:332
 deactivate_super+0xad/0xd0 fs/super.c:363
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1186
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:169 [inline]
 exit_to_user_mode_prepare+0x23c/0x250 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:294
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7ff00688a557
Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff46e14f08 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007ff00688a557
RDX: 00007fff46e14fd9 RSI: 000000000000000a RDI: 00007fff46e14fd0
RBP: 00007fff46e14fd0 R08: 00000000ffffffff R09: 00007fff46e14da0
R10: 000055555661c903 R11: 0000000000000246 R12: 00007ff0068e21f8
R13: 00007fff46e16090 R14: 000055555661c810 R15: 00007fff46e160d0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__fscache_relinquish_cookie.cold+0xee/0x107 fs/fscache/cookie.c:957
Code: c1 ea 03 0f b6 14 02 4c 89 e8 83 e0 07 83 c0 03 38 d0 7c 04 84 d2 75 14 48 63 75 04 31 d2 48 c7 c7 40 cc df 89 e8 57 99 fc ff <0f> 0b 4c 89 ef e8 24 12 97 f8 eb e2 48 89 ef e8 1a 12 97 f8 e9 72
RSP: 0000:ffffc90002f17b90 EFLAGS: 00010282
RAX: 0000000000000019 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff888042fde1c0 RSI: ffffffff815f4a18 RDI: fffff520005e2f64
RBP: ffff888069794040 R08: 0000000000000019 R09: 0000000000000001
R10: ffffffff815ef3ee R11: 0000000000000000 R12: ffff888069794130
R13: ffff888069794044 R14: ffff88807894aab0 R15: ffff88801d84aa00
FS:  000055555661b400(0000) GS:ffff88802cc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff131d09b8 CR3: 00000000654f7000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

