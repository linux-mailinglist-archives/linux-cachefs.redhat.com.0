Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CA3E528DA59
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Oct 2020 09:15:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-xKNfzJ7SNeO9m9zzCjwtPA-1; Wed, 14 Oct 2020 03:15:30 -0400
X-MC-Unique: xKNfzJ7SNeO9m9zzCjwtPA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA2131074669;
	Wed, 14 Oct 2020 07:15:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9A035D9D5;
	Wed, 14 Oct 2020 07:15:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2816181A06B;
	Wed, 14 Oct 2020 07:15:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DNMJnB021820 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 19:22:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A18C117A97B; Tue, 13 Oct 2020 23:22:19 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05B4D117A960
	for <linux-cachefs@redhat.com>; Tue, 13 Oct 2020 23:22:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8192811E79
	for <linux-cachefs@redhat.com>; Tue, 13 Oct 2020 23:22:15 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-PJaQUT6mOG2Bw5Dg5TUQmA-1; Tue, 13 Oct 2020 19:22:11 -0400
X-MC-Unique: PJaQUT6mOG2Bw5Dg5TUQmA-1
Received: by mail-io1-f72.google.com with SMTP id t187so1125325iof.22
	for <linux-cachefs@redhat.com>; Tue, 13 Oct 2020 16:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=CLuWVMOjTHLbVNABKCSg2IFm2uuzV5Q3xX78MVcxpa4=;
	b=bMcyG4Z4cP/GXQYdLLuC4+1i9rvws95Q/l0RoEFS5q3jivO1O1ldAAt3LBKhuDvnZQ
	E2aFvMaAbj+y+xZZI0m6yelxKPkzLIEdzrwdBVFFp9MFdcUCaEkswRND972jG/m8ccpU
	IKmTBTdC2KgbAfKa6DQFCXRcN1arRdiDbsj3ry4IIXoRLB5BWHocXSf+eJCtroDLsZqx
	ZwagMe6Gcmsf5IvktmVyFsv8RRaxJMsI7k/+ZokfT2Y2WhcfF88mI0aa25A2o5p5mnHF
	JS6kZsXo8yzc51z9sXvjg+9tI6+ZhUVpSOCY07E5aZdQPCMDdPVdAJvbX0b1T0b7TH++
	sDBg==
X-Gm-Message-State: AOAM531eyDEa6qnX0+uN2RE/eOGH4t79Ce93EtCPkMFYWIJ3yfP4gL4i
	AT5j3wvEmaf2m8yGVxYhFE5HUntFIi6wqRXImpZdmPw6Ejvy
X-Google-Smtp-Source: ABdhPJytMsqmWbNomF8life4uIsoh57pgRfO8LWK7P/0il52Zr6aq3csqgwDl0EGu6aQpKwHDoshMH+2UFz2BT0T3chWMPkfCFqf
MIME-Version: 1.0
X-Received: by 2002:a5d:9842:: with SMTP id p2mr850448ios.113.1602631330275;
	Tue, 13 Oct 2020 16:22:10 -0700 (PDT)
Date: Tue, 13 Oct 2020 16:22:10 -0700
In-Reply-To: <157941.1602619974@warthog.procyon.org.uk>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000025a54905b195af3d@google.com>
From: syzbot <syzbot+2d0585e5efcd43d113c2@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Wed, 14 Oct 2020 03:15:19 -0400
Subject: Re: [Linux-cachefs] KASAN: use-after-free Read in
	fscache_alloc_cookie
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING: proc registration bug in afs_manage_cell_work

------------[ cut here ]------------
proc_dir_entry 'afs/^]$[+%]0${' already registered
WARNING: CPU: 0 PID: 8309 at fs/proc/generic.c:371 proc_register+0x34c/0x700 fs/proc/generic.c:371
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 8309 Comm: kworker/0:4 Not tainted 5.9.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: afs afs_manage_cell_work
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 panic+0x382/0x7fb kernel/panic.c:231
 __warn.cold+0x20/0x4b kernel/panic.c:600
 report_bug+0x1bd/0x210 lib/bug.c:198
 handle_bug+0x38/0x90 arch/x86/kernel/traps.c:234
 exc_invalid_op+0x14/0x40 arch/x86/kernel/traps.c:254
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:536
RIP: 0010:proc_register+0x34c/0x700 fs/proc/generic.c:371
Code: df 48 89 f9 48 c1 e9 03 80 3c 01 00 0f 85 5d 03 00 00 48 8b 44 24 28 48 c7 c7 a0 62 9a 88 48 8b b0 d8 00 00 00 e8 46 03 5d ff <0f> 0b 48 c7 c7 e0 f6 1e 8a e8 36 df 3d 06 48 8b 4c 24 38 48 b8 00
RSP: 0018:ffffc90009dffac8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff8880923a4480 RSI: ffffffff815f5a55 RDI: fffff520013bff4b
RBP: ffff888088829b88 R08: 0000000000000001 R09: ffff8880ae4318e7
R10: 0000000000000000 R11: 0000000000000000 R12: ffff8880904699d8
R13: ffff8880931d3340 R14: dffffc0000000000 R15: 000000000000000a
 proc_mkdir_data+0x140/0x1a0 fs/proc/generic.c:487
 proc_net_mkdir include/linux/proc_fs.h:201 [inline]
 afs_proc_cell_setup+0xb2/0x1f0 fs/afs/proc.c:619
 afs_activate_cell fs/afs/cell.c:684 [inline]
 afs_manage_cell fs/afs/cell.c:768 [inline]
 afs_manage_cell_work+0x5b7/0x11c0 fs/afs/cell.c:832
 process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x3b5/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Kernel Offset: disabled
Rebooting in 86400 seconds..


Tested on:

commit:         f8eb8d1c afs: Add tracing for cell refcount and active use..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
console output: https://syzkaller.appspot.com/x/log.txt?x=1414b0d8500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=302928762dfb5528
dashboard link: https://syzkaller.appspot.com/bug?extid=2d0585e5efcd43d113c2
compiler:       gcc (GCC) 10.1.0-syz 20200507

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

