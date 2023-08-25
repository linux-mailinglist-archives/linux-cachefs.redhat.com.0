Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B6A78D402
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383819;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9BEXvaHDOmixOsWrS15OnFBnGT1UT6A5GYDCiRmWp7w=;
	b=KvDN7g3UsaF3kKy8+hB8LIYz2eiLycxgNIzyNRtzr+y/NKLCQApBgihcivtWt1PMQlngXU
	6oDeKaL1xGo5T+jfCjzIO5y6RfQuikpqeDmI6Hho2UyoGbCFCejsBotGmq9O9Ny9mh312i
	fOlPj1tmXyGP+J36rQ38ASAYJNCaaSs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-ZjOQ9YwNM8eO0LwyiSocGQ-1; Wed, 30 Aug 2023 04:23:36 -0400
X-MC-Unique: ZjOQ9YwNM8eO0LwyiSocGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E4E03811814;
	Wed, 30 Aug 2023 08:23:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84A4E2166B25;
	Wed, 30 Aug 2023 08:23:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 457B519459EC;
	Wed, 30 Aug 2023 08:23:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE73319465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 13:57:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ADFF82026D76; Fri, 25 Aug 2023 13:57:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A67102026D68
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 13:57:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 882ED85D062
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 13:57:20 +0000 (UTC)
Received: from out-253.mta1.migadu.com (out-253.mta1.migadu.com
 [95.215.58.253]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-lpKCd0DdNCOBVsYpT6lPWg-1; Fri, 25 Aug 2023 09:57:18 -0400
X-MC-Unique: lpKCd0DdNCOBVsYpT6lPWg-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:08 +0800
Message-Id: <20230825135431.1317785-7-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 06/29] vfs: add file_pos_unlock() for
 io_uring usage
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

Add a helper to unlock f_pos_lock without any condition. Introduce this
since io_uring handles f_pos_lock not with a fd struct, thus
FDPUT_POS_UNLOCK isn't used.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 include/linux/file.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/file.h b/include/linux/file.h
index bcc6ba0aec50..a179f4794341 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -81,6 +81,11 @@ static inline void fdput_pos(struct fd f)
 	fdput(f);
 }
 
+static inline void file_pos_unlock(struct file *file)
+{
+	__f_unlock_pos(file);
+}
+
 extern int file_pos_lock_nowait(struct file *file, bool nowait);
 
 DEFINE_CLASS(fd, struct fd, fdput(_T), fdget(fd), int fd)
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

