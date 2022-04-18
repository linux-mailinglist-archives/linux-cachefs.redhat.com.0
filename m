Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5150501D
	for <lists+linux-cachefs@lfdr.de>; Mon, 18 Apr 2022 14:19:10 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-amEgZHH_MgODzX-5MEDd4w-1; Mon, 18 Apr 2022 08:19:06 -0400
X-MC-Unique: amEgZHH_MgODzX-5MEDd4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA0E4299E752;
	Mon, 18 Apr 2022 12:19:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4EF0E141513E;
	Mon, 18 Apr 2022 12:19:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B35D71947BBB;
	Mon, 18 Apr 2022 12:19:01 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 53B1A19451F1 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 18 Apr 2022 12:19:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36170145D493; Mon, 18 Apr 2022 12:19:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 322C0141513E
 for <linux-cachefs@redhat.com>; Mon, 18 Apr 2022 12:19:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 178C329ABA33
 for <linux-cachefs@redhat.com>; Mon, 18 Apr 2022 12:19:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-VKHMD1HdMECxxPDJY9uZsg-1; Mon, 18 Apr 2022 08:18:58 -0400
X-MC-Unique: VKHMD1HdMECxxPDJY9uZsg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 548CC60F3E;
 Mon, 18 Apr 2022 12:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65372C385A1;
 Mon, 18 Apr 2022 12:18:56 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 18 Apr 2022 14:10:48 +0200
Message-Id: <20220418121208.383594279@linuxfoundation.org>
In-Reply-To: <20220418121203.462784814@linuxfoundation.org>
References: <20220418121203.462784814@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH 5.17 079/219] cachefiles: Fix KASAN
 slab-out-of-bounds in cachefiles_set_volume_xattr
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dave Wysochanski <dwysocha@redhat.com>

[ Upstream commit 7b2f6c306601240635c72caa61f682e74d4591b2 ]

Use the actual length of volume coherency data when setting the
xattr to avoid the following KASAN report.

 BUG: KASAN: slab-out-of-bounds in cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
 Write of size 4 at addr ffff888101e02af4 by task kworker/6:0/1347

 CPU: 6 PID: 1347 Comm: kworker/6:0 Kdump: loaded Not tainted 5.18.0-rc1-nfs-fscache-netfs+ #13
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-4.fc34 04/01/2014
 Workqueue: events fscache_create_volume_work [fscache]
 Call Trace:
  <TASK>
  dump_stack_lvl+0x45/0x5a
  print_report.cold+0x5e/0x5db
  ? __lock_text_start+0x8/0x8
  ? cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
  kasan_report+0xab/0x120
  ? cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
  kasan_check_range+0xf5/0x1d0
  memcpy+0x39/0x60
  cachefiles_set_volume_xattr+0xa0/0x350 [cachefiles]
  cachefiles_acquire_volume+0x2be/0x500 [cachefiles]
  ? __cachefiles_free_volume+0x90/0x90 [cachefiles]
  fscache_create_volume_work+0x68/0x160 [fscache]
  process_one_work+0x3b7/0x6a0
  worker_thread+0x2c4/0x650
  ? process_one_work+0x6a0/0x6a0
  kthread+0x16c/0x1a0
  ? kthread_complete_and_exit+0x20/0x20
  ret_from_fork+0x22/0x30
  </TASK>

 Allocated by task 1347:
  kasan_save_stack+0x1e/0x40
  __kasan_kmalloc+0x81/0xa0
  cachefiles_set_volume_xattr+0x76/0x350 [cachefiles]
  cachefiles_acquire_volume+0x2be/0x500 [cachefiles]
  fscache_create_volume_work+0x68/0x160 [fscache]
  process_one_work+0x3b7/0x6a0
  worker_thread+0x2c4/0x650
  kthread+0x16c/0x1a0
  ret_from_fork+0x22/0x30

 The buggy address belongs to the object at ffff888101e02af0
 which belongs to the cache kmalloc-8 of size 8
 The buggy address is located 4 bytes inside of
 8-byte region [ffff888101e02af0, ffff888101e02af8)

 The buggy address belongs to the physical page:
 page:00000000a2292d70 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x101e02
 flags: 0x17ffffc0000200(slab|node=0|zone=2|lastcpupid=0x1fffff)
 raw: 0017ffffc0000200 0000000000000000 dead000000000001 ffff888100042280
 raw: 0000000000000000 0000000080660066 00000001ffffffff 0000000000000000
 page dumped because: kasan: bad access detected

 Memory state around the buggy address:
 ffff888101e02980: fc 00 fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc
 ffff888101e02a00: 00 fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc 00
 >ffff888101e02a80: fc fc fc fc 00 fc fc fc fc 00 fc fc fc fc 04 fc
                                                            ^
 ffff888101e02b00: fc fc fc 00 fc fc fc fc 00 fc fc fc fc 00 fc fc
 ffff888101e02b80: fc fc 00 fc fc fc fc 00 fc fc fc fc 00 fc fc fc
 ==================================================================

Fixes: 413a4a6b0b55 "cachefiles: Fix volume coherency attribute"
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/20220405134649.6579-1-dwysocha@redhat.com/ # v1
Link: https://lore.kernel.org/r/20220405142810.8208-1-dwysocha@redhat.com/ # Incorrect v2
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/cachefiles/xattr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 35465109d9c4..00b087c14995 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -203,7 +203,7 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
 	if (!buf)
 		return false;
 	buf->reserved = cpu_to_be32(0);
-	memcpy(buf->data, p, len);
+	memcpy(buf->data, p, volume->vcookie->coherency_len);
 
 	ret = cachefiles_inject_write_error();
 	if (ret == 0)
-- 
2.35.1



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

