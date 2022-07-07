Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6528F569983
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Jul 2022 06:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657169518;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YiAfmWMmQazKrH6qoRWWaAvI5uzJV0bgh9D4X/X+dPM=;
	b=GLr4Gr8m+8nLiXeWD6xjhmmhc7Of42CbloR53aYzZ5f2tZIhqpSwZDMdSgAvycHYh/8sj4
	CLBG5OEFPa81rhxrQr6GKonpQz7IrQDnmy8YMdDtXEsSqbePIIXTyk5eUmagRM67MqjWgo
	AKJ4yM/NDhlgG4Iqy1tm8JTzA2C6gJE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-735mNouMNCatwP5GPDt4uQ-1; Thu, 07 Jul 2022 00:51:55 -0400
X-MC-Unique: 735mNouMNCatwP5GPDt4uQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFA543C0E208;
	Thu,  7 Jul 2022 04:51:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D55A61415108;
	Thu,  7 Jul 2022 04:51:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9FDC3194706A;
	Thu,  7 Jul 2022 04:51:54 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3E6101947067 for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Jul 2022 04:51:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3223A2EF99; Thu,  7 Jul 2022 04:51:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from lxbceph1.gsslab.pek2.redhat.com (unknown [10.72.47.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3371218EC9;
 Thu,  7 Jul 2022 04:51:47 +0000 (UTC)
From: xiubli@redhat.com
To: dhowells@redhat.com,
	idryomov@gmail.com,
	jlayton@kernel.org
Date: Thu,  7 Jul 2022 12:51:12 +0800
Message-Id: <20220707045112.10177-3-xiubli@redhat.com>
In-Reply-To: <20220707045112.10177-1-xiubli@redhat.com>
References: <20220707045112.10177-1-xiubli@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [Linux-cachefs] [PATCH v3 2/2] afs: unlock the folio when vnode is
 marked deleted
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
 william.kucharski@oracle.com, linux-cachefs@redhat.com, vshankar@redhat.com,
 marc.dionne@auristor.com, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org, kirill.shutemov@linux.intel.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiubo Li <xiubli@redhat.com>

The check_write_begin() should unlock the folio if return non-zero,
otherwise locked.

URL: https://tracker.ceph.com/issues/56423
Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 fs/afs/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index afacce797fb9..b23e7b5a48ad 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -379,7 +379,13 @@ static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 
-	return test_bit(AFS_VNODE_DELETED, &vnode->flags) ? -ESTALE : 0;
+	if (test_bit(AFS_VNODE_DELETED, &vnode->flags)) {
+		folio_unlock(*folio);
+		folio_put(*folio);
+		return -ESTALE;
+	}
+
+	return 0;
 }
 
 static void afs_free_request(struct netfs_io_request *rreq)
-- 
2.36.0.rc1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

