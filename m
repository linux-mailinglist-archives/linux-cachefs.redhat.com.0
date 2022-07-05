Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B01956617A
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Jul 2022 04:53:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656989597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yBJjp66HuiSjSEB3xmtSstFqQ1haytosC4MYjPeEfsY=;
	b=g8a60s6+FGHehVAAh4QR5q9uRrP1CB/egUxJhhc8ISHgqvR1mC+YreLoZBZelnECVy+m8X
	ljVz5/Si7kuDoInalrPONwlou57MxIWQ8RkOhkn9t9Ua1rWhYaWwlnHaL9UzT7SnquCKwH
	Ha1iTpDO5oPBzlFozaDwK6yjgjc9Igc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-n68XFMIvN3WNPoxhy2VlEQ-1; Mon, 04 Jul 2022 22:53:14 -0400
X-MC-Unique: n68XFMIvN3WNPoxhy2VlEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 678411C051AC;
	Tue,  5 Jul 2022 02:53:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E3BD4010D2A;
	Tue,  5 Jul 2022 02:53:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1F31A1947052;
	Tue,  5 Jul 2022 02:53:13 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FCF11947041 for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Jul 2022 02:53:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A8D8492CA3; Tue,  5 Jul 2022 02:53:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from lxbceph1.gsslab.pek2.redhat.com (unknown [10.72.47.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A82FD492C3B;
 Tue,  5 Jul 2022 02:53:07 +0000 (UTC)
From: xiubli@redhat.com
To: dhowells@redhat.com
Date: Tue,  5 Jul 2022 10:52:55 +0800
Message-Id: <20220705025255.331695-3-xiubli@redhat.com>
In-Reply-To: <20220705025255.331695-1-xiubli@redhat.com>
References: <20220705025255.331695-1-xiubli@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH v2 2/2] afs: unlock the folio when vnode is
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

The check_write_begin() should unlock the folio if return non-zero,
otherwise locked.

URL: https://tracker.ceph.com/issues/56423
Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 fs/afs/file.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 42118a4f3383..5a9ed181d724 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -379,7 +379,13 @@ static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 
-	return test_bit(AFS_VNODE_DELETED, &vnode->flags) ? -ESTALE : 0;
+	if (test_bit(AFS_VNODE_DELETED, &vnode->flags)) {
+		folio_unlock(folio);
+		folio_put(folio);
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

