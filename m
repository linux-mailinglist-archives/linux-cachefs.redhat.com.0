Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0635628EE
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Jul 2022 04:30:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656642604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mSV3JBu6AA1zPYB9gw+hqN/AXYv3DrHLeAfmkGdOJvQ=;
	b=U5GwoRfmIawH7pS+XoQS3fwU3ww18/vTo4kjtRf2jRrahQa3p+HQsVP3uYG6INbh8bC9kB
	RrKctsocC7pmbG0g4bnCm3t4fKax25ic/4SRSGzlbLKWNkQ/ECZiL6o2ucxfn+PAi2CEgH
	64eMGzeyjdSknwzSPIhJMfFqK7koRX8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-_Fm2r8pYPjCZHcBRAu8v_w-1; Thu, 30 Jun 2022 22:30:01 -0400
X-MC-Unique: _Fm2r8pYPjCZHcBRAu8v_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93C7C101A588;
	Fri,  1 Jul 2022 02:30:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A3A1400E57D;
	Fri,  1 Jul 2022 02:30:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4ADB71947064;
	Fri,  1 Jul 2022 02:30:00 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF03E194704E for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  1 Jul 2022 02:29:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B476F2026987; Fri,  1 Jul 2022 02:29:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from lxbceph1.gsslab.pek2.redhat.com (unknown [10.72.47.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1DE82026D64;
 Fri,  1 Jul 2022 02:29:55 +0000 (UTC)
From: xiubli@redhat.com
To: jlayton@kernel.org,
	idryomov@gmail.com,
	dhowells@redhat.com
Date: Fri,  1 Jul 2022 10:29:46 +0800
Message-Id: <20220701022947.10716-2-xiubli@redhat.com>
In-Reply-To: <20220701022947.10716-1-xiubli@redhat.com>
References: <20220701022947.10716-1-xiubli@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH 1/2] netfs: release the folio lock and put
 the folio before retrying
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Xiubo Li <xiubli@redhat.com>

The lower layer filesystem should always make sure the folio is
locked and do the unlock and put the folio in netfs layer.

URL: https://tracker.ceph.com/issues/56423
Signed-off-by: Xiubo Li <xiubli@redhat.com>
---
 fs/netfs/buffered_read.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 42f892c5712e..257fd37c2461 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -351,8 +351,11 @@ int netfs_write_begin(struct netfs_inode *ctx,
 		ret = ctx->ops->check_write_begin(file, pos, len, folio, _fsdata);
 		if (ret < 0) {
 			trace_netfs_failure(NULL, NULL, ret, netfs_fail_check_write_begin);
-			if (ret == -EAGAIN)
+			if (ret == -EAGAIN) {
+				folio_unlock(folio);
+				folio_put(folio);
 				goto retry;
+			}
 			goto error;
 		}
 	}
-- 
2.36.0.rc1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

