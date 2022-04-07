Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAAC4F7E92
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Apr 2022 14:03:01 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-rWqBqCjtPoepeIutxkLPPg-1; Thu, 07 Apr 2022 08:02:57 -0400
X-MC-Unique: rWqBqCjtPoepeIutxkLPPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADCB5296A623;
	Thu,  7 Apr 2022 12:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 151D6416377;
	Thu,  7 Apr 2022 12:02:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 441961940347;
	Thu,  7 Apr 2022 12:02:50 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 14FBC1947BBE for <linux-cachefs@listman.corp.redhat.com>;
 Thu,  7 Apr 2022 12:02:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5E8B441637E; Thu,  7 Apr 2022 12:02:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AA8041637D
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D81341C01728
 for <linux-cachefs@redhat.com>; Thu,  7 Apr 2022 12:02:47 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-XU3lc4_4N1an8PmfwtMfkA-1; Thu, 07 Apr 2022 08:02:33 -0400
X-MC-Unique: XU3lc4_4N1an8PmfwtMfkA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 34BDBB8272C;
 Thu,  7 Apr 2022 12:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEB8C385A4;
 Thu,  7 Apr 2022 12:02:29 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org,
	dhowells@redhat.com
Date: Thu,  7 Apr 2022 08:02:23 -0400
Message-Id: <20220407120224.76156-5-jlayton@kernel.org>
In-Reply-To: <20220407120224.76156-1-jlayton@kernel.org>
References: <20220407120224.76156-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [RFC PATCH 4/5] ceph: enhance dout messages in
 issue_read codepaths
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
Cc: linux-cachefs@redhat.com, idryomov@gmail.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index e7a7b5d29c7d..0726494a0981 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -190,6 +190,8 @@ static bool ceph_netfs_clamp_length(struct netfs_io_subrequest *subreq)
 	/* Truncate the extent at the end of the current block */
 	ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len,
 				      &objno, &objoff, &xlen);
+	dout("%s: subreq->len=0x%zx xlen=0x%x rsize=0x%x",
+		__func__, subreq->len, xlen, fsc->mount_options->rsize);
 	subreq->len = min(xlen, fsc->mount_options->rsize);
 	return true;
 }
@@ -302,7 +304,9 @@ static void ceph_netfs_issue_read(struct netfs_io_subrequest *subreq)
 		goto out;
 	}
 
-	dout("%s: pos=%llu orig_len=%zu len=%llu\n", __func__, subreq->start, subreq->len, len);
+	dout("%s: pos=%llu orig_len=%zu len=%llu debug_id=%x debug_idx=%hx iter->count=%zx\n",
+		__func__, subreq->start, subreq->len, len, rreq->debug_id,
+		subreq->debug_index, iov_iter_count(&subreq->iter));
 
 	err = iov_iter_get_pages_alloc(&subreq->iter, &pages, len, &page_off);
 	if (err < 0) {
-- 
2.35.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

