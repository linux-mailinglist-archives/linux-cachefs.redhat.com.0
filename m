Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A12C84F350D
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Apr 2022 15:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649166414;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4/MWXmG+1sF9YGn5aczjARSgf1Pv+/bjHanuPd/Ns2o=;
	b=Z/M05pRnYwtSEluoPXt4JxsNZXOZfFVD/NNOI9XQlyx8t61jRKvjuhViSVdMUaXZla7XKB
	7oZhpXV8VZa6U7r5h8C+zQPpykrN7Xt0iSwL4in362aJZLREB0a7d7On27paGbpAiHlwyQ
	juHQboUPLRKSNc6Et1euXhhNWVbFNOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-8aeRfKq-OlWly-sEnq4QRA-1; Tue, 05 Apr 2022 09:46:53 -0400
X-MC-Unique: 8aeRfKq-OlWly-sEnq4QRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E62A899EC2;
	Tue,  5 Apr 2022 13:46:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACEA610BDF;
	Tue,  5 Apr 2022 13:46:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 52C3D194036B;
	Tue,  5 Apr 2022 13:46:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 671E61947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Apr 2022 13:46:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5799240D296D; Tue,  5 Apr 2022 13:46:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.11.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25F154047781;
 Tue,  5 Apr 2022 13:46:50 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: dhowells@redhat.com
Date: Tue,  5 Apr 2022 09:46:49 -0400
Message-Id: <20220405134649.6579-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH] cachefiles: Fix KASAN slab-out-of-bounds in
 cachefiles_set_volume_xattr
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
Cc: smfrench@gmail.com, linux-cachefs@redhat.com, jlayton@kernel.org,
 linux-cifs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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
2.27.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

