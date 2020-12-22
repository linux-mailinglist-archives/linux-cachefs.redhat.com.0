Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 493B42E03C9
	for <lists+linux-cachefs@lfdr.de>; Tue, 22 Dec 2020 02:22:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-MXFGssNdMimOvhPmjJ2ZJw-1; Mon, 21 Dec 2020 20:22:25 -0500
X-MC-Unique: MXFGssNdMimOvhPmjJ2ZJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5527C1005504;
	Tue, 22 Dec 2020 01:22:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46A2017C58;
	Tue, 22 Dec 2020 01:22:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2D079180954D;
	Tue, 22 Dec 2020 01:22:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BM1ML46002917 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 21 Dec 2020 20:22:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF1AA1111442; Tue, 22 Dec 2020 01:22:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3061003207
	for <linux-cachefs@redhat.com>; Tue, 22 Dec 2020 01:22:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A91EC805B03
	for <linux-cachefs@redhat.com>; Tue, 22 Dec 2020 01:22:21 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
	[209.85.210.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-85-I7ul4yLLM9WBsDvwQPfkTw-1; Mon, 21 Dec 2020 20:22:19 -0500
X-MC-Unique: I7ul4yLLM9WBsDvwQPfkTw-1
Received: by mail-ot1-f41.google.com with SMTP id b24so10596588otj.0;
	Mon, 21 Dec 2020 17:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A7LGrv9arxrfdu1GFoCf8wflov+CFF7/hYY5Y4CreBA=;
	b=GkfKP0WSKV9R3sOYI7nTCPbYimnlzqma4boorYwx9A/M64BRa+0aNTO3SBTgF9hpAb
	WrwbSXLHiXw4xb8PXFpN5qtvTAvM+toqhRLcI1lUrzTH8ZOUqjbnlSY4ufevtGh5AyKF
	uiHULbpE2Wpwe+N8HhS7A8lvmcFNKkTXIlkMIabeHZyEEYMFLdGdFcrJe6eDz2n7mtwe
	KFE6pbcSML99uz/MAovC8pNmTGRq6hct5/qTgXYGrFVAVpxdURUo6rNgIrbhEBjANMaJ
	iQHyFTadLu5n0YyvgI/xAw5t/GK1BH8U7c1FUaDgy7D3Lw1gZqBlutk4htLWLDXDi0VB
	nj2g==
X-Gm-Message-State: AOAM531BvnnfOdJqWuhYjwgwUAYsMOz4PE44ysvw8aUR/SmJOZxh6GHG
	sVo3+aerb5WWLXaK7i15b5I=
X-Google-Smtp-Source: ABdhPJzWauZ4OUHVQCKycQCUNjLregUj88VEqRI/lgKXVo6Q989mL8effGg+mlhu6BTPp9ocg7Ka+g==
X-Received: by 2002:a9d:a4e:: with SMTP id 72mr14436297otg.267.1608600137947; 
	Mon, 21 Dec 2020 17:22:17 -0800 (PST)
Received: from localhost.localdomain ([50.236.19.102])
	by smtp.gmail.com with ESMTPSA id
	x20sm4070098oov.33.2020.12.21.17.22.12
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Dec 2020 17:22:16 -0800 (PST)
From: Yafang Shao <laoar.shao@gmail.com>
To: darrick.wong@oracle.com, willy@infradead.org, david@fromorbit.com,
	hch@infradead.org, mhocko@kernel.org, akpm@linux-foundation.org,
	dhowells@redhat.com, jlayton@redhat.com
Date: Tue, 22 Dec 2020 09:21:30 +0800
Message-Id: <20201222012131.47020-4-laoar.shao@gmail.com>
In-Reply-To: <20201222012131.47020-1-laoar.shao@gmail.com>
References: <20201222012131.47020-1-laoar.shao@gmail.com>
MIME-Version: 1.0
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
Cc: Yafang Shao <laoar.shao@gmail.com>, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH v14 3/4] xfs: introduce
	xfs_trans_context_swap() for rolling transaction
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the rolling transaction, thread's NOFS state is transferred from the
old transaction to the new transaction, and then the NOFS state stored
in the old one should be cleared.

Suggested-by: Dave Chinner <david@fromorbit.com>
Cc: Darrick J. Wong <darrick.wong@oracle.com>
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Dave Chinner <david@fromorbit.com>
Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 fs/xfs/xfs_trans.c |  4 +++-
 fs/xfs/xfs_trans.h | 10 +++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 11d390f0d3f2..733e0113aebe 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -119,7 +119,9 @@ xfs_trans_dup(
 
 	ntp->t_rtx_res = tp->t_rtx_res - tp->t_rtx_res_used;
 	tp->t_rtx_res = tp->t_rtx_res_used;
-	ntp->t_pflags = tp->t_pflags;
+
+	/* Associate the new transaction with this thread. */
+	xfs_trans_context_swap(tp, ntp);
 
 	/* move deferred ops over to the new tp */
 	xfs_defer_move(ntp, tp);
diff --git a/fs/xfs/xfs_trans.h b/fs/xfs/xfs_trans.h
index 44b11c64a15e..b428704eeb20 100644
--- a/fs/xfs/xfs_trans.h
+++ b/fs/xfs/xfs_trans.h
@@ -277,7 +277,15 @@ xfs_trans_context_set(struct xfs_trans *tp)
 static inline void
 xfs_trans_context_clear(struct xfs_trans *tp)
 {
-	memalloc_nofs_restore(tp->t_pflags);
+	if (!tp->t_flags)
+		memalloc_nofs_restore(tp->t_pflags);
+}
+
+static inline void
+xfs_trans_context_swap(struct xfs_trans *tp, struct xfs_trans *ntp)
+{
+	ntp->t_pflags = tp->t_pflags;
+	tp->t_flags = -1;
 }
 
 #endif	/* __XFS_TRANS_H__ */
-- 
2.18.4

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

