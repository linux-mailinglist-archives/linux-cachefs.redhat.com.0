Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D159B493680
	for <lists+linux-cachefs@lfdr.de>; Wed, 19 Jan 2022 09:45:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-m_6swQGhPTG3OTQeIFVYcA-1; Wed, 19 Jan 2022 03:45:33 -0500
X-MC-Unique: m_6swQGhPTG3OTQeIFVYcA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAB99100C667;
	Wed, 19 Jan 2022 08:45:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5546610589DA;
	Wed, 19 Jan 2022 08:45:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96A6A1806D03;
	Wed, 19 Jan 2022 08:45:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20IF0a7T020320 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 10:00:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C9230C08097; Tue, 18 Jan 2022 15:00:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C52C08088
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 15:00:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABB5985A5BA
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 15:00:36 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-168-mlH9w5DGNSivNbsRxqOXjQ-1; Tue, 18 Jan 2022 10:00:34 -0500
X-MC-Unique: mlH9w5DGNSivNbsRxqOXjQ-1
Received: by mail-il1-f197.google.com with SMTP id
	l15-20020a056e0212ef00b002b8afab2075so6338977iln.3
	for <linux-cachefs@redhat.com>; Tue, 18 Jan 2022 07:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=JQlTbA6+YjZ7/xARdHk/c5Khre58MY9UXtPTEtteDJ0=;
	b=kMpCYK3DavAWz1UNOCB0OtiquGb86YjZF/GuxpiWuuJYRaUB+se9jky/6Njvb4khDb
	RWCGRE+oAVt8nlzgscHdWkcyYWFiE6wE7/SdL7NAHlQlgHYffa0hcRJT0hcz0FDBmrS/
	zCglD6ysjYXuX0bwNc1hLDaXfpDFXnNXpDbrRtxWYLCQhcBl9srpf3Z9edKs1SNb1hf0
	ndgS4zaKjF43Rqe+6inYAIfryrmzNvoQiIE9EzuJsxtbPF7OJE9qMjwZSv4MYIndf6R1
	C+jQ+l66qXPGAPj3aPa/FUp3U/ZhR4Lt3FQLkfIfZBWlPTTqYOa2dk4ONp4WFtx3ZJre
	8TDg==
X-Gm-Message-State: AOAM532V9ESo3aD61c/QbIQ05xkr0uF5kQh6QDseDyIdJRe6ElQMyD9n
	FWjstKAHLPgs9WRj8Q+k5irxuLBNmnDyW46gFCzJbMQYMGXj
X-Google-Smtp-Source: ABdhPJwBIX9BpgakaefFJcxmSPHb1wNaeldbJxTQNaQQRFSnu61yr3GRRP4LapGU26hWnEt8Kgha3neHZty+ApMPIQ/ietrXCW0B
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cd:: with SMTP id
	13mr14512618ilx.139.1642518033901; 
	Tue, 18 Jan 2022 07:00:33 -0800 (PST)
Date: Tue, 18 Jan 2022 07:00:33 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f2b07b05d5dc87cc@google.com>
From: syzbot <syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 19 Jan 2022 03:45:25 -0500
Subject: [Linux-cachefs] [syzbot] general protection fault in
	fscache_free_cookie
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

syzbot found the following issue on:

HEAD commit:    f079ab01b560 Merge tag 'iomap-5.17' of git://git.infradead..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15f575cfb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=788482192d4000d
dashboard link: https://syzkaller.appspot.com/bug?extid=5b129e8586277719bab3
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5b129e8586277719bab3@syzkaller.appspotmail.com

RBP: 00007fb28e1911d0 R08: 0000000020000280 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007ffe01f9c0cf R14: 00007fb28e191300 R15: 0000000000022000
 </TASK>
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 9511 Comm: syz-executor.1 Not tainted 5.16.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:__list_del_entry_valid+0x81/0xf0 lib/list_debug.c:51
Code: 0f 84 19 69 35 05 48 b8 22 01 00 00 00 00 ad de 49 39 c4 0f 84 1a 69 35 05 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 75 51 49 8b 14 24 48 39 ea 0f 85 d1 68 35 05 49 8d 7d
RSP: 0018:ffffc9000714fa10 EFLAGS: 00010256
RAX: dffffc0000000000 RBX: ffffffff89ec31a0 RCX: ffffffff815d148a
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff888148f8ddd8
RBP: ffff888148f8ddd0 R08: 0000000000000001 R09: 0000000000000003
R10: fffff52000e29f38 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880293d0a00
FS:  00007fb28e191700(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5cb26cf310 CR3: 00000000799aa000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 __list_del_entry include/linux/list.h:134 [inline]
 list_del include/linux/list.h:148 [inline]
 fscache_free_cookie fs/fscache/cookie.c:71 [inline]
 fscache_free_cookie+0x77/0x330 fs/fscache/cookie.c:66
 fscache_alloc_cookie+0x67a/0x790 fs/fscache/cookie.c:195
 __fscache_acquire_cookie+0x16c/0x600 fs/fscache/cookie.c:296
 fscache_acquire_cookie include/linux/fscache.h:334 [inline]
 v9fs_cache_session_get_cookie+0xf2/0x2f0 fs/9p/cache.c:60
 v9fs_session_init+0xe02/0x1780 fs/9p/v9fs.c:472
 v9fs_mount+0x73/0xa80 fs/9p/vfs_super.c:125
 legacy_get_tree+0x105/0x220 fs/fs_context.c:610
 vfs_get_tree+0x89/0x2f0 fs/super.c:1500
 do_new_mount fs/namespace.c:2994 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3324
 do_mount fs/namespace.c:3337 [inline]
 __do_sys_mount fs/namespace.c:3545 [inline]
 __se_sys_mount fs/namespace.c:3522 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3522
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7fb28f81beb9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fb28e191168 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fb28f92ef60 RCX: 00007fb28f81beb9
RDX: 0000000020000b80 RSI: 0000000020000040 RDI: 0000000000000000
RBP: 00007fb28e1911d0 R08: 0000000020000280 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000002
R13: 00007ffe01f9c0cf R14: 00007fb28e191300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace e959b745799b2618 ]---
RIP: 0010:__list_del_entry_valid+0x81/0xf0 lib/list_debug.c:51
Code: 0f 84 19 69 35 05 48 b8 22 01 00 00 00 00 ad de 49 39 c4 0f 84 1a 69 35 05 48 b8 00 00 00 00 00 fc ff df 4c 89 e2 48 c1 ea 03 <80> 3c 02 00 75 51 49 8b 14 24 48 39 ea 0f 85 d1 68 35 05 49 8d 7d
RSP: 0018:ffffc9000714fa10 EFLAGS: 00010256
RAX: dffffc0000000000 RBX: ffffffff89ec31a0 RCX: ffffffff815d148a
RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff888148f8ddd8
RBP: ffff888148f8ddd0 R08: 0000000000000001 R09: 0000000000000003
R10: fffff52000e29f38 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880293d0a00
FS:  00007fb28e191700(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f5cb26cf310 CR3: 00000000799aa000 CR4: 0000000000350ef0
----------------
Code disassembly (best guess):
   0:	0f 84 19 69 35 05    	je     0x535691f
   6:	48 b8 22 01 00 00 00 	movabs $0xdead000000000122,%rax
   d:	00 ad de
  10:	49 39 c4             	cmp    %rax,%r12
  13:	0f 84 1a 69 35 05    	je     0x5356933
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	4c 89 e2             	mov    %r12,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	75 51                	jne    0x81
  30:	49 8b 14 24          	mov    (%r12),%rdx
  34:	48 39 ea             	cmp    %rbp,%rdx
  37:	0f 85 d1 68 35 05    	jne    0x535690e
  3d:	49                   	rex.WB
  3e:	8d                   	.byte 0x8d
  3f:	7d                   	.byte 0x7d


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

