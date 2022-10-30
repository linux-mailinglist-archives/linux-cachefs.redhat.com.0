Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCFF61775B
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Nov 2022 08:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667459538;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lxtQAN5vOYh+wgNL9IoyKgCfUschDBAJq+/hoVJ3mvI=;
	b=UcjyW1cioBicSARCYcgLDQKYTxW+EGgIozLpF0rR0rFYXtKd/ZpN7sK6YQ18DiA0h8/6Xr
	dgSnxjEd5SBvXnNmC2wtFvt+poF4zcrxBfxbTy9Xd5svQHE85BEBznYaa0DlO3amgMH30p
	I8xrCjYvyWwKs1ZwDCWSdprmKjIDiqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-KNdowPWHN6yLAkcp7GAq_A-1; Thu, 03 Nov 2022 03:12:15 -0400
X-MC-Unique: KNdowPWHN6yLAkcp7GAq_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0500811E67;
	Thu,  3 Nov 2022 07:12:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DDB140C6EC3;
	Thu,  3 Nov 2022 07:12:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24BA61946A46;
	Thu,  3 Nov 2022 07:12:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 848A31946589 for <linux-cachefs@listman.corp.redhat.com>;
 Sun, 30 Oct 2022 10:32:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6EDE92166BA3; Sun, 30 Oct 2022 10:32:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 677B42166B2F
 for <linux-cachefs@redhat.com>; Sun, 30 Oct 2022 10:32:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 496383801F4B
 for <linux-cachefs@redhat.com>; Sun, 30 Oct 2022 10:32:50 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-mLDEr4cJNxCb7L3LF22V0A-1; Sun, 30 Oct 2022 06:32:46 -0400
X-MC-Unique: mLDEr4cJNxCb7L3LF22V0A-1
Received: by mail-ed1-f48.google.com with SMTP id 21so13774272edv.3;
 Sun, 30 Oct 2022 03:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5RScUteu20GvcnE65OXTNl6SrxBr8fKR/TbseFaB9A=;
 b=PInvxCnUyB26Eu/Q/8GMUWjdH6e2nizVier9+m2g41xkTbkkM2sFz+tVK7VDNVNrok
 AnonIbqJyR8ynjuxkx1e1FxXO5ToNX6K49320WlY+NI++6LNTn6qPjeQINk+xiX0JwVd
 2Ioy1GwznmNvyQhI/qiTVTdlPyN/9M7HyaY/HtI4pmRQXlvxeTgK4LY+MZYYRggO+M29
 i7Xr+ZWgxsI9DUIrlSfE9dK+GMXw+vEDo19yXuJCYkq/1nQs7RDkeRue4VE2sR1SZ31f
 dd+s1xqElizLJi9q7LfVVwx6y5jXUs6k/BZVFOLGthleQax5urvdGrSEtHPKxLzbasPX
 nUUA==
X-Gm-Message-State: ACrzQf0Nya91tcjPCwSIfoVgOAY1BLleUufb0EEPveutVSFzcQ/Ae7z7
 Y/eNYoQwTdPY6IV8q6ite5yI0hJYNJRNfVyxDmNZLE5yB/bMgg==
X-Google-Smtp-Source: AMsMyM7wl/EPwJRnDJ8gxfzNlLMhSS+JV1He+rGRREObOmSnaLYy2VK0WqU0UhcxByQK3whIe0YsJ5ACks5Ej3eQLG4=
X-Received: by 2002:a05:6402:10c2:b0:45c:3c87:721f with SMTP id
 p2-20020a05640210c200b0045c3c87721fmr8454420edu.251.1667125964826; Sun, 30
 Oct 2022 03:32:44 -0700 (PDT)
MIME-Version: 1.0
From: Wei Chen <harperchen1110@gmail.com>
Date: Sun, 30 Oct 2022 18:32:08 +0800
Message-ID: <CAO4mrfeYuKpeskCfNMG=0YuHMTGh7LbyfK0pXH+zc40MKkSh+g@mail.gmail.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, 
 linux-kernel@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Thu, 03 Nov 2022 07:12:11 +0000
Subject: [Linux-cachefs] BUG: unable to handle kernel NULL pointer
 dereference in fscache_free_cookie
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear Linux Developer,

Recently when using our tool to fuzz kernel, the following crash was triggered:

HEAD commit: 64570fbc14f8 Linux 5.15-rc5
git tree: upstream
compiler: gcc 8.0.1
console output:
https://drive.google.com/file/d/1XbBDSFuHIAMsOAmvF0ITxNg8CEr443UB/view?usp=share_link
kernel config: https://drive.google.com/file/d/1uDOeEYgJDcLiSOrx9W8v2bqZ6uOA_55t/view?usp=share_link

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: Wei Chen <harperchen1110@gmail.com>

RBP: 000000000000004a R08: 00000000200007c0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000119bfac
R13: 0000000000000000 R14: 000000000119bfa0 R15: 00007fffa5a71650
BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 14091067 P4D 14091067 PUD 14092067 PMD 0
Oops: 0000 [#1] PREEMPT SMP
CPU: 1 PID: 13456 Comm: syz-executor.0 Not tainted 5.15.0-rc5 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.13.0-48-gd9c812dda519-prebuilt.qemu.org 04/01/2014
RIP: 0010:__list_del_entry_valid+0x2d/0x50
Code: 01 00 00 00 00 ad de 48 8b 07 48 8b 57 08 48 39 c8 0f 84 cd cb
46 02 48 b9 22 01 00 00 00 00 ad de 48 39 ca 0f 84 f0 cb 46 02 <48> 8b
32 48 39 fe 0f 85 d0 cb 46 02 48 8b 50 08 48 39 f2 0f 85 b5
RSP: 0018:ffffc9000cf63c28 EFLAGS: 00010217
RAX: 0000000000000000 RBX: ffff88800f2113d8 RCX: dead000000000122
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88800f211490
RBP: 0000000000000079 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff86485018 R11: 0000000000000000 R12: 000000000000001f
R13: 0000000000000000 R14: ffffffff8518ba40 R15: 0000000000000000
FS:  00007f0e4932c700(0000) GS:ffff88813dc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000014090000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 fscache_free_cookie+0x45/0x120
 fscache_alloc_cookie+0x331/0x350
 __fscache_acquire_cookie+0x132/0x620
 v9fs_cache_session_get_cookie+0x7d/0x140
 v9fs_session_init+0x798/0xac0
 v9fs_mount+0x53/0x480
 legacy_get_tree+0x2e/0x90
 vfs_get_tree+0x29/0x100
 path_mount+0x58e/0x10a0
 do_mount+0x9b/0xb0
 __x64_sys_mount+0x13a/0x150
 do_syscall_64+0x34/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x4692c9
Code: f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 48 89 f8 48
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d
01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0e4932bc38 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f0e4932bc80 RCX: 00000000004692c9
RDX: 00000000200002c0 RSI: 0000000020000100 RDI: 0000000000000000
RBP: 000000000000004a R08: 00000000200007c0 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000119bfac
R13: 0000000000000000 R14: 000000000119bfa0 R15: 00007fffa5a71650
Modules linked in:
CR2: 0000000000000000
---[ end trace 15cdfd4d79de03b8 ]---
RIP: 0010:__list_del_entry_valid+0x2d/0x50
Code: 01 00 00 00 00 ad de 48 8b 07 48 8b 57 08 48 39 c8 0f 84 cd cb
46 02 48 b9 22 01 00 00 00 00 ad de 48 39 ca 0f 84 f0 cb 46 02 <48> 8b
32 48 39 fe 0f 85 d0 cb 46 02 48 8b 50 08 48 39 f2 0f 85 b5
RSP: 0018:ffffc9000cf63c28 EFLAGS: 00010217
RAX: 0000000000000000 RBX: ffff88800f2113d8 RCX: dead000000000122
RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88800f211490
RBP: 0000000000000079 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff86485018 R11: 0000000000000000 R12: 000000000000001f
R13: 0000000000000000 R14: ffffffff8518ba40 R15: 0000000000000000
FS:  00007f0e4932c700(0000) GS:ffff88813dc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000014090000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0: 01 00                add    %eax,(%rax)
   2: 00 00                add    %al,(%rax)
   4: 00 ad de 48 8b 07    add    %ch,0x78b48de(%rbp)
   a: 48 8b 57 08          mov    0x8(%rdi),%rdx
   e: 48 39 c8              cmp    %rcx,%rax
  11: 0f 84 cd cb 46 02    je     0x246cbe4
  17: 48 b9 22 01 00 00 00 movabs $0xdead000000000122,%rcx
  1e: 00 ad de
  21: 48 39 ca              cmp    %rcx,%rdx
  24: 0f 84 f0 cb 46 02    je     0x246cc1a
* 2a: 48 8b 32              mov    (%rdx),%rsi <-- trapping instruction
  2d: 48 39 fe              cmp    %rdi,%rsi
  30: 0f 85 d0 cb 46 02    jne    0x246cc06
  36: 48 8b 50 08          mov    0x8(%rax),%rdx
  3a: 48 39 f2              cmp    %rsi,%rdx
  3d: 0f                    .byte 0xf
  3e: 85                    .byte 0x85
  3f: b5                    .byte 0xb5

Best,
Wei

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

