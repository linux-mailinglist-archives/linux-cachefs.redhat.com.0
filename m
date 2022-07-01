Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 816475628F6
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Jul 2022 04:30:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656642609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bmW6GOD+8j4FVV8uJifXL0YNzjt3GRUPy/NCRJsGZ5Y=;
	b=Rmn9MWKmAF5BZjKwA4NO5y+K0jSQ2pGCpO6GUeJHm1ASR3tHRMVHUR4Na6DIArF/QSnTdG
	Pr9Kt55LJqJmMor5JAQgoOkwHFxcwfkeH+WAjFfa2ibOtIi63MJLHl9Vw08TvPThmHxQ4o
	Czm3woukIfLYI/UXaJAo/mXK+iAsyzQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-qcMFR8-HOnmWZVnxHYTXVA-1; Thu, 30 Jun 2022 22:30:06 -0400
X-MC-Unique: qcMFR8-HOnmWZVnxHYTXVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88F91801233;
	Fri,  1 Jul 2022 02:30:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CE79492C3B;
	Fri,  1 Jul 2022 02:30:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5995D1947064;
	Fri,  1 Jul 2022 02:30:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7D095194704E for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  1 Jul 2022 02:30:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6FAFD2026987; Fri,  1 Jul 2022 02:30:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from lxbceph1.gsslab.pek2.redhat.com (unknown [10.72.47.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CBBC2026D64;
 Fri,  1 Jul 2022 02:30:00 +0000 (UTC)
From: xiubli@redhat.com
To: jlayton@kernel.org,
	idryomov@gmail.com,
	dhowells@redhat.com
Date: Fri,  1 Jul 2022 10:29:47 +0800
Message-Id: <20220701022947.10716-3-xiubli@redhat.com>
In-Reply-To: <20220701022947.10716-1-xiubli@redhat.com>
References: <20220701022947.10716-1-xiubli@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH 2/2] ceph: do not release the folio lock in
 kceph
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
 linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, vshankar@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiubo Li <xiubli@redhat.com>

The netfs layer should be responsible to unlock and put the folio,
and we will always return 0 when succeeds.

URL: https://tracker.ceph.com/issues/56423
Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 fs/ceph/addr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index fe6147f20dee..3ef5200e2005 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1310,16 +1310,16 @@ static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned
 	if (snapc) {
 		int r;
 
-		folio_unlock(folio);
-		folio_put(folio);
 		if (IS_ERR(snapc))
 			return PTR_ERR(snapc);
 
+		folio_unlock(folio);
 		ceph_queue_writeback(inode);
 		r = wait_event_killable(ci->i_cap_wq,
 					context_is_writeable_or_written(inode, snapc));
 		ceph_put_snap_context(snapc);
-		return r == 0 ? -EAGAIN : r;
+		folio_lock(folio);
+		return r == 0 ? -EAGAIN : 0;
 	}
 	return 0;
 }
-- 
2.36.0.rc1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

