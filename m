Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7OFVW4QMGQEXKK7FRI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4619BE9C7
	for <lists+linux-cachefs@lfdr.de>; Wed,  6 Nov 2024 13:37:18 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbf054c552sf101316126d6.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 06 Nov 2024 04:37:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1730896637; cv=pass;
        d=google.com; s=arc-20240605;
        b=Q09mEt3We+QGVonPx6l88GuwEJy6dKdpaPM02Auws/KbKnIPfq/owOEYXAjuycI9fS
         2hQRX8xAz2vnR2gXYhmL7rSri2j2rl8I74rwXBvavHDVetjP3iz3+dfeW19d1UCB2YOj
         gzjgguh+GmERnlQVmYIj0tp37sgK7St5YJswyzVl4Q0UcUQ6MBrBLh0RY9svR6aCxnB8
         /CPXJOZARJerQ5Xx3+6WQkmcOyzGYKjrP3Kd7p6MXOEsqkiOJB8bfaK2+uONOvrvKGqJ
         8QeXPWwzd7yMz6/s9NwBHoWxDi521BzPAdm4KYblnx/+VpEr8hgyD+IlzDEFJeCaubdd
         DggA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        fh=Ebdjq2CKCtSihG/MXHimVX8rpnzfD00J/Tps/n7Syww=;
        b=IGvD4327Dcb1ayPNUfkkbO7BgJIg1x15j2ZxIr/ROhLATl+w+ZG27SZD6DME7Ei/9Y
         l6cRWES01HSdALN3DbejJPJqJKGUXZFfeXmJAUQQXAdM8HeU8qxPkjZGK+EFV7lsphyA
         3MXegXy+ijRuFBxjqbmKUekV8indUNmMyB9/d5u3GPEbcVo7Eu7fpGZHKDW4rhWdp6mS
         1ETu4k/f4FgqwuNGmcvNS318BdcGL9MPpLITFPbw5UZq72pyep0yHYMxrFVn7fmO0JbF
         q5xSFCozlsgFKjrXaVVaIZvrsRUVLeWakoJ14ruyhkaOtbwljqWOnGxCgX1z86ngkRoB
         OPpg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.132.61 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.132.61 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730896637; x=1731501437;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        b=jgkjmFXZr+nBZjP40Kjh6PSaR8PcJwB2PgimSpVMy41tQ9rKSemr5/3fsqsBTvoYs3
         WRfsWCgi9rEji/fkOcr5ryIqXRt7CKLQHKNNM/SIut7Kwjk0bShyO7A0FN1vyO8pUPOD
         Odxj6U9woUTvMsm6+Whf46OCfpnyMPqZc/6VPBh3g17GK8FRvAkOaV7RmZpUOUo74UAo
         I1Qvm2RUQ9LNuyEiaZTi6+ggqcj/4HfkNAFwPbGPR0WHphzvHaHrj19L3gy04u5X0MWT
         p2U+Zuug4QbDlRs6MbMgNmKgqq5cwCjXpHLpptIOpyY2HZ88Y4rLwBk4XtgWgo5SemEp
         nrhA==
X-Forwarded-Encrypted: i=2; AJvYcCW7loTHeiTUCHyisBvgVDCH4H1/gUTj6xoz0FX7hd2xpoOBJ1TJURn9Iu/4Steh+XSjAKicJQ==@lfdr.de
X-Gm-Message-State: AOJu0YzyAw2wnaFS1vEVvYUdWsFDOPiKVw4JJKjQdcP6EllVVN3B2MDd
	18RRmyir5YYlTF9YIOY98fscmwSbW2vDhQtfqiaqeqgWhmLJGMwXPiJ4eZq/gdcq/zCxhyU=
X-Google-Smtp-Source: AGHT+IHB9ufGywwbyQItbyFnWAq4sKTV9+w+j1MSvfPfj6F6oBXRhm19+PYuhaPZZa//ausANn0ekw==
X-Received: by 2002:a05:6214:3a89:b0:6cb:ebfa:c478 with SMTP id 6a1803df08f44-6d1856f93bdmr658723466d6.28.1730896637304;
        Wed, 06 Nov 2024 04:37:17 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:409:b0:6b0:8881:bc19 with SMTP id
 6a1803df08f44-6d351af25c1ls7225036d6.1.-pod-prod-08-us; Wed, 06 Nov 2024
 04:37:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZAP5l8Sgaw5yOKVSDD6A8VJrZhiMvXWVMnP9RmwO2skt8UzI04aSpT4GDQx0VOzwR9Z9itCeiSOU2FT2L@gapps.redhat.com
X-Received: by 2002:a05:6102:4189:b0:4a7:4900:4b48 with SMTP id ada2fe7eead31-4a8cfd3d7fdmr35868819137.18.1730896636638;
        Wed, 06 Nov 2024 04:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730896636; cv=none;
        d=google.com; s=arc-20240605;
        b=PYcMgkj9Ium2ouUQkJ5hjxk5mN0eAIR2SVE2ZdHH2HSAIzZsDlJpx2rVCc4fYcad7q
         LnmKHFROksfbKI/UnFO9cnLE+yqlBf+4PYpUp2tPePzPYlBOnGUS+PMro5gp83XOh9Ky
         Z4tLXVX1nDhN54u+m8M1kjnRt1BNI9a3JtU9PT7uTenqyHTi5Z3gOCI8CnpdCJkkS1x2
         9zTijOtzsiqbk+VK9qv4iRqffiCX8u0c47OmGZYVqlDAia/yrcZUvLXooKLYz0Dq2F5s
         wfS/U02G/mMd9n3e4uFu1Popb/raJA5jZtHYLFpHtSShw0LnwxpZH835XotUcjnNoatU
         03WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=X3twVFG043O59vporSoGB49KW0yXOb7j0HiRw4sYWo4=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=X5pBv7vD2bQdtc9B1boCtQ6qCtFAzmSDrgl7Bgpeahk9Aantfw7M1u4HdZiYYIi7rh
         I4bqxeHpM++7RfUtB/a8PsTCNZH75wq2cwscUlZkRWAoC2czQaz24rG1Z4R3rbOxEvOf
         u5E3VwcT/b6BmInFIMoQT0lnarvw0qmd1VOlACa+HmSZEgsYoPd6po8y34GaL2L05FbI
         SQLhndzgxsLqTs0/oq6LjALyvsiDcJHnQSNS8fQ1yuiPdhR1nYoQi4IOvoWINU/PFCEp
         KEciAEZOeOam3G8EW5dl40O3vBicI8phlY33zeCxDGBpiwpbFoQFzEEAYcETY17lVkSy
         501w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.132.61 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.132.61 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.132.61])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3a0381fsi1611754185a.197.2024.11.06.04.37.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 04:37:16 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.132.61 as internal address)
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-N27aadZ9OLmjtvmExc2VNw-1; Wed,
 06 Nov 2024 07:37:15 -0500
X-MC-Unique: N27aadZ9OLmjtvmExc2VNw-1
X-Mimecast-MFC-AGG-ID: N27aadZ9OLmjtvmExc2VNw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 588941955F2B
	for <linux-cachefs@gapps.redhat.com>; Wed,  6 Nov 2024 12:37:14 +0000 (UTC)
Received: by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id 34505195607C; Wed,  6 Nov 2024 12:37:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C38391956088;
	Wed,  6 Nov 2024 12:37:07 +0000 (UTC)
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
Subject: [PATCH v3 08/33] netfs: Make netfs_advance_write() return size_t
Date: Wed,  6 Nov 2024 12:35:32 +0000
Message-ID: <20241106123559.724888-9-dhowells@redhat.com>
In-Reply-To: <20241106123559.724888-1-dhowells@redhat.com>
References: <20241106123559.724888-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 536ufEwtUpaV7TRRLpJ4G-9-bwlAmanFvoEI0zsCf34_1730896634
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.132.61 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.132.61 policy.d=gapps.redhat.com
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
index 993cc6def38e..c186221b45c0 100644
--- a/fs/netfs/write_issue.c
+++ b/fs/netfs/write_issue.c
@@ -271,9 +271,9 @@ void netfs_issue_write(struct netfs_io_request *wreq,
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

