Return-Path: <linux-cachefs+bncBDLIXLMFVAERBL5BQK5QMGQE632653A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FEA9F3B16
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Dec 2024 21:42:25 +0100 (CET)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ae31bb8ee3sf88865905ab.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 16 Dec 2024 12:42:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1734381744; cv=pass;
        d=google.com; s=arc-20240605;
        b=eBiGLy0/AXW99H1aJF1CEYs+gAkSdlAhUDXqnWfO2UGw4TZQyFWwItSJx4OP/pHuw2
         qijEZawUQ6dmPmEUpjHr4MihDfG2MdHt/wetsK/Tt6t5U0nReysKZ3gT/QVtUL5+iGpf
         2woeid3YZOc5hGfKgJ2LEAR4xVFvs3/YftpgKzBdHsWu2nNr2Gw6YgV04BVe531sOR63
         8gan2ObeK3CBAhbi/7IXeLPEdgvnOeJIjKyJz0Xcw+sq7fcOMMddocIgAQa2p6YnesrM
         ZpRzu9FORmtp7IyfjkYlarw+QZuw/Ij5xq1VzrC1cGtIm7GTXRhCIyLFKoauKYXGb64e
         wPXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7aA9QxRrFWK/P9rkUH+hLdM3u9kYyfAeJJCCbAY2jNE=;
        fh=yNdWsKeZyASawj6y9fFbg/umlRamNo4tvb/3/3ujo/s=;
        b=P2vzZYdFLF+4AJhCzUXTEFLw9AfsvpeYIZYe2nL/DHnBjpqcOJargB4hu3UNDsj+99
         pqwqc5Gq5ha61cFaXJkHcSIvdZg786qSF8J4YM07kkBCizcALHKr4V6yfdGAjIOOfTAU
         vhSoNd+81H9ciDu0E6EJ4Zld+bEGH+b6494QRwGlYtdgCKMRb7yNvQrQN8hRcpaDV6V0
         sIXOatC5PjK6nyAcvl6nyekfaFgGQFW+SaT6V+5TC0qhWpXsxFI0f71tgGIVCYiSUE79
         5gZxaQTEDcjAhRVuC6u+asr8DB+K8KO3X3KN7tivfkILcjPzjyBu9EBsSErbYM2/6FWC
         y5mA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734381744; x=1734986544;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aA9QxRrFWK/P9rkUH+hLdM3u9kYyfAeJJCCbAY2jNE=;
        b=ksnApkbb9VSjA+to41opBNyIKKFCHogg2ZPpsV20tEZsBiqskdfOeaEWHcDIgm2q+N
         FQOlbl0BmYzPdas8UYvDyg5YL8POvxNVh82jDkiWOKBOzsclrOUksYUdAMknCvv2+qxX
         XPOlTXcj6a5GO6Slu3gAJEuKi0DOPxcqWORQs2OstWwMYvhK/yn2xg0yP15hXPSiJ8Xz
         dJ/UWwZSJH4cL+ElAWLVbgTur8rVaLQioNfmzU1EjYfYOU9mmCiLluioXOzKSkmnlFwT
         2NXNGT81YXSfv35JJYf5Dl3SZPHoJ5yKazfvPOEeKHwLehqfzvs/NS5RubY12hayQV2F
         7+lQ==
X-Forwarded-Encrypted: i=2; AJvYcCUEpaUBoSQxH3CIOzFG/K21vOZH0X9xy/Bvy94osQpbOELQSk5Z8OkBgGIItIJUlU4yHhShtw==@lfdr.de
X-Gm-Message-State: AOJu0YwGfaXOw8za2CfRLUzjhHo5y5pBuU5GdiEQDCEJXs3VOiNzlkd/
	DjU+z0/lv6suMhVwuN70WOG47OoBaPZnwyvuyTnmiGSPsSB0H2laIMPB8K4D5Nc=
X-Google-Smtp-Source: AGHT+IEsBwbPFdOD2185tWAhnfnKHOrjJ7neVo633Xbh1r+yaqYLk+OkBlGjwo8slripDEOAmbdhFg==
X-Received: by 2002:a05:6e02:1788:b0:3a7:9347:544c with SMTP id e9e14a558f8ab-3afed372573mr142212185ab.5.1734381744084;
        Mon, 16 Dec 2024 12:42:24 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6e02:164e:b0:3a7:ccb2:e434 with SMTP id
 e9e14a558f8ab-3b050a33bcfls29824415ab.2.-pod-prod-05-us; Mon, 16 Dec 2024
 12:42:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVaD9R3YcYcMMZVTG/7TwFp1Z+vVNguL5ZemRSTHXItyvV+Qo6oSbWraEqqw8XWjQbtcL7q+XdbPyKAUPkU@gapps.redhat.com
X-Received: by 2002:a05:6e02:b4e:b0:3a7:7ded:5219 with SMTP id e9e14a558f8ab-3aff1022d65mr148299295ab.21.1734381743269;
        Mon, 16 Dec 2024 12:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734381743; cv=none;
        d=google.com; s=arc-20240605;
        b=cfm9cBl9YNmE0BeOS99fis8rc0yjSn0WVyAgJ3heiIjl27ZSh5Y/w2zmfIZr20jifv
         JdUPguprDn7T5Zs1yecAzAtmnUoCp0mmCA29a6ZkF6F0WmdScEPOBPV6cJrujwlM/Xge
         id//GBFexbYW+3eP1ePu3VcR/uVlejYoRg0aLtAUD5NGDYa9OdujPl4QbMjtx+rW/el8
         NshaDKC/Lt3qTdmQQ9RRtkNMmmzza5Jjl4UiYD0NKzN4DoRelYIgnNDtw8W0KCw2n//T
         2KxKXz+mcA016nJQFrwzPsUdiqBG3icTbIXh5lsU5ZhccQmttnQXwZ4MaAyitRDsBHSy
         uirQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=PF30MqttAq61NFCi8PPBXJ+dvrfjZ/56jbstyvCuFx4=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=IquuRRHhsg1bmnRxoGgv3ljovmw4JDiNhx/UyuhAeuJuKQJmMnN1JkQK1cKS6fb8uN
         j4Zrhjeiv9DrrFifWvraJLakjeqAI/nwk6nsbU5T0UY4mEwB4QZ94WYOFPQ6Bx4X6BPn
         /s2MzM95pz7BH/P6HxDhzzEOI/vEwevvgyplTRSA6+TCDcTmbVekJnRCbyB2rjLVzU+I
         1oOaeP1BBA4uzpml6aP71ep7bVYg+w35MVDHP4qlTenzWFXMH4xQqvQ36aOJoba9r/69
         HtKQYQNue4WSDhycP7/z+GS019q5XFi5Mq8th3vVUoJAY/iVbpWxoSfhBpL5Y7Cjb+ov
         An3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id 8926c6da1cb9f-4e5e3d60452si4141352173.139.2024.12.16.12.42.23
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 12:42:23 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-o1pN8_KIOIyVIrnlkOJEqg-1; Mon,
 16 Dec 2024 15:42:21 -0500
X-MC-Unique: o1pN8_KIOIyVIrnlkOJEqg-1
X-Mimecast-MFC-AGG-ID: o1pN8_KIOIyVIrnlkOJEqg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C66481956063
	for <linux-cachefs@gapps.redhat.com>; Mon, 16 Dec 2024 20:42:20 +0000 (UTC)
Received: by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id C140319560B1; Mon, 16 Dec 2024 20:42:20 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.48])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 32F6219560A2;
	Mon, 16 Dec 2024 20:42:13 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [PATCH v5 06/32] netfs: Make netfs_advance_write() return size_t
Date: Mon, 16 Dec 2024 20:40:56 +0000
Message-ID: <20241216204124.3752367-7-dhowells@redhat.com>
In-Reply-To: <20241216204124.3752367-1-dhowells@redhat.com>
References: <20241216204124.3752367-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iJclm6Sir8DeDfEHGWqYwy3Z9gRlgjamvEDDO7zOX64_1734381740
X-Mimecast-Originator: redhat.com
content-type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

netfs_advance_write() calculates the amount of data it's attaching to a
stream with size_t, but then returns this as an int.  Switch the return
value to size_t for consistency.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/internal.h    | 6 +++---
 fs/netfs/write_issue.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index ccd9058acb61..6aa2a8d49b37 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -178,9 +178,9 @@ void netfs_reissue_write(struct netfs_io_stream *stream,
 			 struct iov_iter *source);
 void netfs_issue_write(struct netfs_io_request *wreq,
 		       struct netfs_io_stream *stream);
-int netfs_advance_write(struct netfs_io_request *wreq,
-			struct netfs_io_stream *stream,
-			loff_t start, size_t len, bool to_eof);
+size_t netfs_advance_write(struct netfs_io_request *wreq,
+			   struct netfs_io_stream *stream,
+			   loff_t start, size_t len, bool to_eof);
 struct netfs_io_request *netfs_begin_writethrough(struct kiocb *iocb, size_t len);
 int netfs_advance_writethrough(struct netfs_io_request *wreq, struct writeback_control *wbc,
 			       struct folio *folio, size_t copied, bool to_page_end,
diff --git a/fs/netfs/write_issue.c b/fs/netfs/write_issue.c
index 88ceba49ff69..7a14a48e62ee 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -273,9 +273,9 @@ void netfs_issue_write(struct netfs_io_request *wreq,
  * we can avoid overrunning the credits obtained (cifs) and try to parallelise
  * content-crypto preparation with network writes.
  */
-int netfs_advance_write(struct netfs_io_request *wreq,
-			struct netfs_io_stream *stream,
-			loff_t start, size_t len, bool to_eof)
+size_t netfs_advance_write(struct netfs_io_request *wreq,
+			   struct netfs_io_stream *stream,
+			   loff_t start, size_t len, bool to_eof)
 {
 	struct netfs_io_subrequest *subreq = stream->construct;
 	size_t part;

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

