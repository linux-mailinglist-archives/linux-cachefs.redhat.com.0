Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1BE51A0BB
	for <lists+linux-cachefs@lfdr.de>; Wed,  4 May 2022 15:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651670475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m1WOc8kJPfwjDvcnGTUy3YeR0jOzXnixyGsbHiK0lig=;
	b=RdPe/aQz5+/YgiyYByZ5dYyVhZW92+k07gre+cIP0IdyzvLqJ2bDN2+6+/YMdFGHfKLRuQ
	2aIKocUdW2cvgHpHix/XVLgQTZYZANzegxKjJHktLyAGNzragdIz2qLnZNRlxa+VCdNSSn
	dv7GD69vwii9UdLvRGXV6y9tsooB7JQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-G0bKNrjbN4Cg7pmz30KHMA-1; Wed, 04 May 2022 09:21:13 -0400
X-MC-Unique: G0bKNrjbN4Cg7pmz30KHMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11593380450D;
	Wed,  4 May 2022 13:21:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1284155BC8B;
	Wed,  4 May 2022 13:21:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 60A4F1947049;
	Wed,  4 May 2022 13:21:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EA8111947043 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  4 May 2022 13:21:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C367E155BC8E; Wed,  4 May 2022 13:21:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.9.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 82A86155BC8B;
 Wed,  4 May 2022 13:21:08 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Wed,  4 May 2022 09:21:06 -0400
Message-Id: <20220504132106.28812-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Linux-cachefs] [PATCH] NFS: Pass i_size to fscache_unuse_cookie()
 when a file is released
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
Cc: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Pass updated i_size in fscache_unuse_cookie() when called
from nfs_fscache_release_file(), which ensures the size of
an fscache object gets written to the cache storage.  Failing
to do so results in unnessary reads from the NFS server, even
when the data is cached, due to a cachefiles object coherency
check failing with a trace similar to the following:
  cachefiles_coherency: o=0000000e BAD osiz B=afbb3 c=0

This problem can be reproduced as follows:
  #!/bin/bash
  v=4.2; NFS_SERVER=127.0.0.1
  set -e; trap cleanup EXIT; rc=1
  function cleanup {
          umount /mnt/nfs > /dev/null 2>&1
          RC_STR="TEST PASS"
          [ $rc -eq 1 ] && RC_STR="TEST FAIL"
          echo "$RC_STR on $(uname -r) with NFSv$v and server $NFS_SERVER"
  }
  mount -o vers=$v,fsc $NFS_SERVER:/export /mnt/nfs
  rm -f /mnt/nfs/file1.bin > /dev/null 2>&1
  dd if=/dev/zero of=/mnt/nfs/file1.bin bs=4096 count=1 > /dev/null 2>&1
  echo 3 > /proc/sys/vm/drop_caches
  echo Read file 1st time from NFS server into fscache
  dd if=/mnt/nfs/file1.bin of=/dev/null > /dev/null 2>&1
  umount /mnt/nfs && mount -o vers=$v,fsc $NFS_SERVER:/export /mnt/nfs
  echo 3 > /proc/sys/vm/drop_caches
  echo Read file 2nd time from fscache
  dd if=/mnt/nfs/file1.bin of=/dev/null > /dev/null 2>&1
  echo Check mountstats for NFS read
  grep -q "READ: 0" /proc/self/mountstats # (1st number) == 0
  [ $? -eq 0 ] && rc=0

Fixes: a6b5a28eb56c "nfs: Convert to new fscache volume/cookie API"
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index f73c09a9cf0a..e861d7bae305 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -231,11 +231,10 @@ void nfs_fscache_release_file(struct inode *inode, struct file *filp)
 {
 	struct nfs_fscache_inode_auxdata auxdata;
 	struct fscache_cookie *cookie = nfs_i_fscache(inode);
+	loff_t i_size = i_size_read(inode);
 
-	if (fscache_cookie_valid(cookie)) {
-		nfs_fscache_update_auxdata(&auxdata, inode);
-		fscache_unuse_cookie(cookie, &auxdata, NULL);
-	}
+	nfs_fscache_update_auxdata(&auxdata, inode);
+	fscache_unuse_cookie(cookie, &auxdata, &i_size);
 }
 
 /*
-- 
2.27.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

