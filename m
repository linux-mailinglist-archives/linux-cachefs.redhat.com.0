Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B14D078D3EB
	for <lists+linux-cachefs@lfdr.de>; Wed, 30 Aug 2023 10:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693383785;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iQ0+cXRkO7+Ik3vFRjeZOOilKrc8pSeaoefBpto+Hkc=;
	b=i8B8jHUbauuN0Rek9VemQ2FtTMDidi8Zwm1cVTb51oeWbAvZ3bsorXbijJ3ag0jXDgCMWu
	aqumbDdkckZy9UBmGdMW1sdMDuylvcLxOk+khmPko9ZLPomF8andcQbBAYuNUWkIklYlbA
	yH+hdw7mOrN4+NgdR8+OIy7CXZ9NRbo=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-ExMdHYLDMLqxh5Na5bQ3Hg-1; Wed, 30 Aug 2023 04:22:59 -0400
X-MC-Unique: ExMdHYLDMLqxh5Na5bQ3Hg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3BFC71C0512E;
	Wed, 30 Aug 2023 08:22:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 31A5240316A;
	Wed, 30 Aug 2023 08:22:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8C721946A47;
	Wed, 30 Aug 2023 08:22:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0280E19465A8 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 13:56:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D51E340D283A; Fri, 25 Aug 2023 13:56:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDF2040D2839
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 13:56:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AECD43C0FC90
 for <linux-cachefs@redhat.com>; Fri, 25 Aug 2023 13:56:49 +0000 (UTC)
Received: from out-250.mta1.migadu.com (out-250.mta1.migadu.com
 [95.215.58.250]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-sdOEdH2gMnWLOPTLy8WccA-1; Fri, 25 Aug 2023 09:56:47 -0400
X-MC-Unique: sdOEdH2gMnWLOPTLy8WccA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:07 +0800
Message-Id: <20230825135431.1317785-6-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Wed, 30 Aug 2023 08:22:42 +0000
Subject: [Linux-cachefs] [PATCH 05/29] vfs: add a vfs helper for io_uring
 file pos lock
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Hao Xu <howeyxu@tencent.com>

Add a vfs helper file_pos_lock_nowait() for io_uring usage. The function
have conditional nowait logic, i.e. if nowait is needed, return -EAGAIN
when trylock fails.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/file.c            | 13 +++++++++++++
 include/linux/file.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/fs/file.c b/fs/file.c
index 35c62b54c9d6..8e5c38f5db52 100644
--- a/fs/file.c
+++ b/fs/file.c
@@ -1053,6 +1053,19 @@ void __f_unlock_pos(struct file *f)
 	mutex_unlock(&f->f_pos_lock);
 }
 
+int file_pos_lock_nowait(struct file *file, bool nowait)
+{
+	if (!(file->f_mode & FMODE_ATOMIC_POS))
+		return 0;
+
+	if (!nowait)
+		mutex_lock(&file->f_pos_lock);
+	else if (!mutex_trylock(&file->f_pos_lock))
+		return -EAGAIN;
+
+	return 1;
+}
+
 /*
  * We only lock f_pos if we have threads or if the file might be
  * shared with another process. In both cases we'll have an elevated
diff --git a/include/linux/file.h b/include/linux/file.h
index 6e9099d29343..bcc6ba0aec50 100644
--- a/include/linux/file.h
+++ b/include/linux/file.h
@@ -81,6 +81,8 @@ static inline void fdput_pos(struct fd f)
 	fdput(f);
 }
 
+extern int file_pos_lock_nowait(struct file *file, bool nowait);
+
 DEFINE_CLASS(fd, struct fd, fdput(_T), fdget(fd), int fd)
 
 extern int f_dupfd(unsigned int from, struct file *file, unsigned flags);
-- 
2.25.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

