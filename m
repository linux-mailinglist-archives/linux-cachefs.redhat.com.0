Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBFC566178
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 04:53:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656989586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DMn6udPAGaYhDgyLGrBgoo4PKg+lo0tY8gPgR112HeA=;
	b=Slx2IwYs5pHwmMlNyZxui7l9uG3elyi+Or85hEYK8wJ79XgdU1NdCZt3dl5F0i995N7/Ql
	iCUkDMoRWV2wKqtdDbxUP75aLxcaL9SiGVMgJiHCuuBlo5mwLx+MimrYexO82BnsUJHDS/
	YD/TQ3QFPipunB+X2GK/RGZwL95TLLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-FAYtJdbmM8CzTbrmhRHpAA-1; Mon, 04 Jul 2022 22:53:05 -0400
X-MC-Unique: FAYtJdbmM8CzTbrmhRHpAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A3BE8001EA;
	Tue,  5 Jul 2022 02:53:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 647C440218D3;
	Tue,  5 Jul 2022 02:53:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0277F1947052;
	Tue,  5 Jul 2022 02:53:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B2D821947041 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Jul 2022 02:53:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A132D492CA3; Tue,  5 Jul 2022 02:53:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from lxbceph1.gsslab.pek2.redhat.com (unknown [10.72.47.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4683492C3B;
 Tue,  5 Jul 2022 02:52:58 +0000 (UTC)
From: xiubli@redhat.com
To: dhowells@redhat.com
Date: Tue,  5 Jul 2022 10:52:53 +0800
Message-Id: <20220705025255.331695-1-xiubli@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v2 0/2] netfs: fix the crash when unlocking
 the folio
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
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, willy@infradead.org,
 marc.dionne@auristor.com, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiubo Li <xiubli@redhat.com>

V2:
- Add error_unlocked lable and rename error lable to error_locked.


kernel: page:00000000c9746ff1 refcount:2 mapcount:0 mapping:00000000dc2785bb index:0x1 pfn:0x141afc
kernel: memcg:ffff88810f766000
kernel: aops:ceph_aops [ceph] ino:100000005e7 dentry name:"postgresql-Fri.log" 
kernel: flags: 0x5ffc000000201c(uptodate|dirty|lru|private|node=0|zone=2|lastcpupid=0x7ff)
kernel: raw: 005ffc000000201c ffffea000a9eeb48 ffffea00060ade48 ffff888193ed8228
kernel: raw: 0000000000000001 ffff88810cc96500 00000002ffffffff ffff88810f766000
kernel: page dumped because: VM_BUG_ON_FOLIO(!folio_test_locked(folio))
kernel: ------------[ cut here ]------------
kernel: kernel BUG at mm/filemap.c:1559!
kernel: invalid opcode: 0000 [#1] PREEMPT SMP PTI
kernel: CPU: 4 PID: 131697 Comm: postmaster Tainted: G S                5.19.0-rc2-ceph-g822a4c74e05d #1
kernel: Hardware name: Supermicro SYS-5018R-WR/X10SRW-F, BIOS 2.0 12/17/2015
kernel: RIP: 0010:folio_unlock+0x26/0x30
kernel: Code: 00 0f 1f 00 0f 1f 44 00 00 48 8b 07 a8 01 74 0e f0 80 27 fe 78 01 c3 31 f6 e9 d6 fe ff ff 48 c7 c6 c0 81 37 82 e8 aa 64 04 00 <0f> 0b 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 8b 87 b8 01 00 00
kernel: RSP: 0018:ffffc90004377bc8 EFLAGS: 00010246
kernel: RAX: 000000000000003f RBX: ffff888193ed8228 RCX: 0000000000000001
kernel: RDX: 0000000000000000 RSI: ffffffff823a3569 RDI: 00000000ffffffff
kernel: RBP: ffffffff828a0058 R08: 0000000000000001 R09: 0000000000000001
kernel: R10: 000000007c6b0fd2 R11: 0000000000000034 R12: 0000000000000001
kernel: R13: 00000000fffffe00 R14: ffffea000506bf00 R15: ffff888193ed8000
kernel: FS:  00007f4993626340(0000) GS:ffff88885fd00000(0000) knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 0000555789ee8000 CR3: 000000017a52a006 CR4: 00000000001706e0
kernel: Call Trace:
kernel: <TASK>
kernel: netfs_write_begin+0x130/0x950 [netfs]
kernel: ceph_write_begin+0x46/0xd0 [ceph]
kernel: generic_perform_write+0xef/0x200
kernel: ? file_update_time+0xd4/0x110
kernel: ceph_write_iter+0xb01/0xcd0 [ceph]
kernel: ? lock_is_held_type+0xe3/0x140
kernel: ? new_sync_write+0x106/0x180
kernel: new_sync_write+0x106/0x180
kernel: vfs_write+0x29a/0x3a0
kernel: ksys_write+0x5c/0xd0
kernel: do_syscall_64+0x34/0x80
kernel: entry_SYSCALL_64_after_hwframe+0x46/0xb0
kernel: RIP: 0033:0x7f49903205c8
kernel: Code: 89 02 48 c7 c0 ff ff ff ff eb b3 0f 1f 80 00 00 00 00 f3 0f 1e fa 48 8d 05 d5 3f 2a 00 8b 00 85 c0 75 17 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 58 c3 0f 1f 80 00 00 00 00 41 54 49 89 d4 55
kernel: RSP: 002b:00007fff104bd178 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
kernel: RAX: ffffffffffffffda RBX: 0000000000000048 RCX: 00007f49903205c8
kernel: RDX: 0000000000000048 RSI: 000055944d3c1ea0 RDI: 000000000000000b
kernel: RBP: 000055944d3c1ea0 R08: 000055944d3963d0 R09: 00007fff1055b080
kernel: R10: 0000000000000000 R11: 0000000000000246 R12: 000055944d3962f0
kernel: R13: 0000000000000048 R14: 00007f49905bb880 R15: 0000000000000048
kernel: </TASK>



Xiubo Li (2):
  netfs: do not unlock and put the folio twice
  afs: unlock the folio when vnode is marked deleted

 fs/afs/file.c            |  8 +++++++-
 fs/netfs/buffered_read.c | 13 +++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

-- 
2.36.0.rc1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

