Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEFZS2YAMGQE4PVKZCI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DDC890564
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:36:33 +0100 (CET)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-69057317d23sf15917576d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:36:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643792; cv=pass;
        d=google.com; s=arc-20160816;
        b=IBBsWXN4CTfPQv71I1FCGtCL1FlZCFHJbiWA4EtUKml5VW69CwQbYrFLWqy7oGjxPN
         /npeR+//iwvl1Wcf7vfH74V5638GKS171sKIGlRdwJK1X6d754MVHPBRLzwzf8hbXFrO
         ddBknPUu6SRyTS2sUzCdpjmP3bps6KXw24DkC1ZVt65H1Gze+3TPezsYTTWgs02B9Ias
         Cla1ejBgDkc+Anwe0Ex1C0tL+56XR3zrcjcfluHCJLrgAnKccim+obsyfHB9MJ9Sbos7
         A+0aF/BFnvjG6eDtEnWZC4nhULR1yBGErbf8f1Ccxb2+RE2PWQNp1Xy612VgnxKBGIXP
         jYeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=IXP0rEBe48FfIWqjF2xEk3Z27nApS6NNolSu03CUNl4=;
        fh=VmRwt5+IA0HWbnXzEslflRpfr36LhnC+UiqF5Icziyw=;
        b=tXV3PzD2D4Tgb64WYwH+YGZ8rREN2PffO3fi1dqHn6dfz4yxbmbfogo38WT3zzT4kV
         ggUFWEBjPy6iCtIDuaA3WkX4MjapCaSL9HHIA/ySUAJKXnRxnygNBXj/KmkKqzn+agL9
         v9tQm0lxdUMoYKPKjmjB/6NBch8Jd/f6TXZ+UBQ4AkV7YKHClqWA1EVQ7xm9HLxMosOU
         yFieFd24B9ssZdyAl/gGNMBOifnWxpaALJXYcdtKKxkeYiQmoK+X5sVs4KgGOLHDmhzP
         6X82pfZkpyIoKe665lMv5JmlbqYO+qH+T8jVnOpNuAAvotDJcNBFdinlUYJud44mdi6p
         Asdg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643792; x=1712248592;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXP0rEBe48FfIWqjF2xEk3Z27nApS6NNolSu03CUNl4=;
        b=oknk0tkBnmEP5qjLbGNPiu/0XpmK8zk6kHmCnS/Y3mRA2eK55pw8rQwZq+rvY69mc1
         JVszYLlVR6Gc68NbvRbQj62Ptd47WgbT7eMK/C9+S0ZeEpSunIz/Q4oxNCFUqDanprJk
         R0akyXgx5+xtit4BFvz+jiDFdxc/oCazmYXqbOB41Lq/BglhGoUKQLnKt8OVapGuHTjS
         Al9M8DySlg+0pzP5yZKwkfnH66It9d3Y9fJFkTXYOkIr3m8Aj2ihQEJts3ELIK8oWIXN
         FgIX2Rwto+yB3QYZM1jvtOSNIgBao5wbLtyKGlVTEFhatEbKgMKfV4un0/8APw7ejxeA
         S8QA==
X-Forwarded-Encrypted: i=2; AJvYcCVGDmb8hdKyf/NqJymcbpD5tG3NVCUcByjCpQES5POTRR9kWdoMVwnZZKpP177OKtDJOdrIANk9Vf5OUDVd1RSIT6H28F4JF5R++FM=
X-Gm-Message-State: AOJu0Yx7QOWjZ6xBA9yUDpt5si18QL8m9sJrJ2ssdQG8gqZSVL8nP7zC
	cxK0w53vvHwQzJ3KOVV/jSMd+xcyJElBtIPwIlscIeCcJ6DSFrud7mJ67ROcizw=
X-Google-Smtp-Source: AGHT+IHNqVIVlYBLh002+J4gTGpGCv0C0aNsmYwBZY1YnKgPkdluDTl33KkYU8/pujHTG7jTqp2Z4g==
X-Received: by 2002:a05:6214:5584:b0:696:8bc4:6cb4 with SMTP id mi4-20020a056214558400b006968bc46cb4mr3233182qvb.47.1711643792369;
        Thu, 28 Mar 2024 09:36:32 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2606:b0:696:78dc:ab6a with SMTP id
 gu6-20020a056214260600b0069678dcab6als1789071qvb.0.-pod-prod-06-us; Thu, 28
 Mar 2024 09:36:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX2epbaJHxL3iDPjqI24hhgt9T70UDhGwbC0wAV5L5fny/9mNFcTC9+X2cR/REjmYHCn1u5eaBeL7l18PBW+ppFG1X+fhy9U6nD8e02BpQ=
X-Received: by 2002:a05:6214:18b:b0:696:7ff4:7f0a with SMTP id q11-20020a056214018b00b006967ff47f0amr3271610qvr.34.1711643791715;
        Thu, 28 Mar 2024 09:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643791; cv=none;
        d=google.com; s=arc-20160816;
        b=sErkksAhzNHd/968dVs0wWHI/qctTkAqdSu2mR9BB9QVX7a9Px6pFsq/Qbb+gr4Wg5
         WvvB21u0Nk9oHGlhI5Y52NW+wi9/dn5AuL6eXOO/9QnS1AmU0pB//KYV89j22hPdKPUa
         VpfTXW7GFOKyVqKpxp3t1ftvmiKSId2i36SH8XGwbSDGfff0c7N/XQwuXNIajnZAjJHv
         HpZ02Zyc3Du/+aTrTo9iioHa/gPqUiGnFOsM4aiAG68+pDlKDcc8m9zXDzjpKFyLyWut
         8jSxqdAeR8onTTTYrgsoI4RCeg5YObSPlgMHv2bCf0ERiNAKwUY9LUdeRAk4uTGRyw7w
         rmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=DTOCRVKlSMdVpJyaVTQSUOcv3/giUpppfoW0qaRDdtA=;
        fh=dijFYpEVp+4ijccmXeOrV1fnLJQjsqwgNfcTPuMjuvg=;
        b=sBDIwmEZAUQiH/LaCZjm1PJiHy4RY9FZTnIK2ZveCh3l2kEyFJQX0mZZOBSZ90gInN
         4RcElawlhmqEJPks6fYeAs0i9ufs/hU+EOOrQpCUwwxw3OwvK6hR4mHUBoa7XauBOAXR
         hRR5Bth3K30w4JO1M+HIuFVRyV2sZohA1A/L/PhMuySkx6YzeN/yejlxFMJWvOpr2xzu
         9KFJOF0gy6PXJuwXsOP++aPWjjLgXgJhEwjRVSk7P3Tzfnq+ou5eFKGnHj/XvgBwBSHi
         5P9VH9/9p0+p8AH+fJie/wnzA9ULvs1Qy73/ErisKEuamPro0/szeItcFihrFQX7rrwK
         Oucg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y3-20020ad45303000000b006968d8dbd06si1702831qvr.171.2024.03.28.09.36.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:36:31 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-8zXoiDT4PLGfG_LBN53t0w-1; Thu, 28 Mar 2024 12:36:29 -0400
X-MC-Unique: 8zXoiDT4PLGfG_LBN53t0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C07C188F2EF
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:36:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id BD22B3C20; Thu, 28 Mar 2024 16:36:27 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 95C5137F2;
	Thu, 28 Mar 2024 16:36:24 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/26] netfs: Make netfs_io_request::subreq_counter an atomic_t
Date: Thu, 28 Mar 2024 16:33:59 +0000
Message-ID: <20240328163424.2781320-8-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Make the netfs_io_request::subreq_counter, used to generate values for
netfs_io_subrequest::debug_index, into an atomic_t so that it can be called
from the retry thread at the same time as the app thread issuing writes.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/netfs/output.c     | 2 +-
 include/linux/netfs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/output.c b/fs/netfs/output.c
index 625eb68f3e5a..fbdbb4f78234 100644
--- a/fs/netfs/output.c
+++ b/fs/netfs/output.c
@@ -37,7 +37,7 @@ struct netfs_io_subrequest *netfs_create_write_request(struct netfs_io_request *
 		subreq->source	= dest;
 		subreq->start	= start;
 		subreq->len	= len;
-		subreq->debug_index = wreq->subreq_counter++;
+		subreq->debug_index = atomic_inc_return(&wreq->subreq_counter);
 
 		switch (subreq->source) {
 		case NETFS_UPLOAD_TO_SERVER:
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index f36a6d8163d1..ddafc6ebff42 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -202,7 +202,7 @@ struct netfs_io_request {
 	unsigned int		debug_id;
 	unsigned int		rsize;		/* Maximum read size (0 for none) */
 	unsigned int		wsize;		/* Maximum write size (0 for none) */
-	unsigned int		subreq_counter;	/* Next subreq->debug_index */
+	atomic_t		subreq_counter;	/* Next subreq->debug_index */
 	atomic_t		nr_outstanding;	/* Number of ops in progress */
 	atomic_t		nr_copy_ops;	/* Number of copy-to-cache ops in progress */
 	size_t			submitted;	/* Amount submitted for I/O so far */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

