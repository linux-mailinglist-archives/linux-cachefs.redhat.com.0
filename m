Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7EWXG4QMGQEQYBXUMQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 114119C2311
	for <lists+linux-cachefs@lfdr.de>; Fri,  8 Nov 2024 18:33:50 +0100 (CET)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-710cbc3ddfcsf2329768a34.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 08 Nov 2024 09:33:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1731087228; cv=pass;
        d=google.com; s=arc-20240605;
        b=SrNC91qqbIWkbz8HU+X0KSNYKmUqIMutUvCsyNaYhp9tMsVwumsawdIRV9SdYOrBnv
         FPUSH2bI+jyKcqGeA2tnOW5Iu0QE7pSMmOaf2f4hhxaoK3jzlI2wSIsOFQ3+unegQRTs
         utkm67sJa7XRH1FwCgC8PGehWLngecs8pTnsEm4bz3siO/w+mEiv6g8dqiOuAIfHhOtP
         1w6STvAEaQgW764Qr/n4ezE14IhsbFl1BXQUUVnQ5fOItKjFzDagdKxxPp+PF5gQCuoV
         2hkfEpcMU4AR6YfJoOb0nF85AJDMKlGfBxuZO6Xn2A8FQnEG7aFn1Z51gMC3MhoOmrXR
         HqLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        fh=uHjd82EaqG/uvD6g9jjOWHyj97b8FqDpxF2nFLr0hUg=;
        b=fKaKIN/Y1yegdFze1tsGTqpmZ53wcWgvSRyI2bWNvIKoUU9Y5DnRuvcUD8s95jamhC
         vEhrxQyQZ1zjH0dYoH5vsoVnl7cQXtJMDwIU7oUlkoXcbJSIhslODtBqbpIuk1YC/LYG
         LJxTig1QV99VrocDNyFXbkzz5ioUVEMTvGO18Q/NjB5mbSkvodn7vY2u2w6vNlYxX9g1
         KTPjdCyhOSKQPqL2n9FTmeWlCZRIvCKXh3oy+jDQOGwEIX9hHhHYgho10m+iCC4LWorB
         p3x66gnufTPPR9BCwUMdap+ASaMOCEQ3dXhtvaddD+XK5cTocLc71tVan3TEVWzwldym
         xgtA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731087228; x=1731692028;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP6CCksileIVWueqsSKN8i+dF/NyfRL91dgyRRKNQAk=;
        b=a+ORhSM64MhuyZ7FKX+9HBifNbXo4jpu8N8Vacj32rmdWqtaHMtLnWhEyZWNeG3+8v
         8B0EtxCelB1pSeqGv9PCg7hfqheoX/UHwS/1X/92RH8GLxxkE9+wFJbPMRRp1HWadFF0
         YVuP3DluPIdtF7p+Phy3/NeM5HsQRGa4OGA0ZimtepHXgUE/bqRhcO9MfKQ7Vb3eg4sW
         0qQYkzv+hk/oiCCNqX4ornLjV1ps9v4iEwtRoSxGExxbgB/E8AVF5bJkGRDxyJRtrALz
         LX44MBBACOYxCml+NDhRpMN8/FXPqpsPW01sjXIgg7gdvbs6tkRP5YM0NU1P+l6X5vMb
         L+pA==
X-Forwarded-Encrypted: i=2; AJvYcCWRjinbUR2Ll0P2hvSZDWdJqk1mYAQQUzzxMOaAa9TmqJ0/9K8BTeBvU2z8/zB2F6v3rMDsfQ==@lfdr.de
X-Gm-Message-State: AOJu0Yzxgd+rtQAy0wwEeGX5XInjG1mLR0Iq6gz6EFnA1XIgvzLdX2AV
	IAxgerSa2NZwLny6xna50RD4On6s134DSUcSsRiniRBqfm1FtIgS9EEjRdY5gxM=
X-Google-Smtp-Source: AGHT+IFxMoLJghpVdsvu/qhZO7ki3ucIWY2ulgXy+FqHVbNnTTeBJdUZHfMuGMtBKpaczLFY8s5Sng==
X-Received: by 2002:a05:6871:292:b0:277:c216:5273 with SMTP id 586e51a60fabf-2956008f7a9mr3609746fac.18.1731087228363;
        Fri, 08 Nov 2024 09:33:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:c69f:b0:277:ef03:8cc7 with SMTP id
 586e51a60fabf-29541016b9cls2087970fac.1.-pod-prod-08-us; Fri, 08 Nov 2024
 09:33:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhLh/cqdPhhXCDDxPDOuqF8t3Y4GaX0DyQmP0AaXPrG/FmKR8YVtf50X35kUFM3JWARsZJXAfP3DOfEThE@gapps.redhat.com
X-Received: by 2002:a05:6830:498d:b0:718:194d:8a6 with SMTP id 46e09a7af769-71a1c28846amr5383601a34.28.1731087227616;
        Fri, 08 Nov 2024 09:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731087227; cv=none;
        d=google.com; s=arc-20240605;
        b=DlMaQ3RtLqcWYmP1nfw1NEx5REt3snLVjTH7cxyVQYkkabQiKywBHMc3rTF26xyqfk
         OZYYi6H5n44bc9nwCB4yNYjI18jR1m75K4NO5/5FlFTjw5YHncSVd/59obRGqYH0mygn
         LJAdD8LdaphtotFrbWRZaN68rIcbVqYwk92N8FCht5mmz732QT9wMLuZYURRSaFPW/cp
         UgvzDrfD6ezc+k3JRnUGXgiUyNfvsvBXEYvowMoxAy423zInq6LfZsx1Ba1BWJluuW0F
         9JNfWwHXRKjbtaSlLarE0a0/r6D2rzATX/QjRV4zQ50qZaFZPqRUc2/OdGCpVBoP+Qdb
         MSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=X3twVFG043O59vporSoGB49KW0yXOb7j0HiRw4sYWo4=;
        fh=S9oLL764npqAlTwfYdPhiOTkO7VjwvYShFF/IFwF3l8=;
        b=duzB5/KjM0qnTfG11jbCgsmi3j6oJV8QtY53XS+fyJvuD5SwbEJFUcacf67BFC6iHO
         kTNfxvRkEBsoIRAUP+agCVwI2n+0t/7OTjEnmSn/3ucZAqAe6tHhZxdKIUVVpEo714u5
         3/fHsDeyRoc3RRASC60GAfFQgXdsrqiZ7lEfq//DwzFkaTf9M8w/SlyvDztt1F06GopP
         08f8XAXhzx0K8I5xwYACGIDZMxlLenFI1EJzjkYyYiIBn76FwyDZIDxvP849grOlRE/+
         k6jWcclL1fpK5qk4u7enKC8qI2yCeAx1Aex153QD9A5gfKxD1jJ+Tb7C7DIn047a/rZM
         fs/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id 71dfb90a1353d-513f325f470si1459836e0c.262.2024.11.08.09.33.47
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 09:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-8QsM_7VLPea6Fhv001d65Q-1; Fri,
 08 Nov 2024 12:33:46 -0500
X-MC-Unique: 8QsM_7VLPea6Fhv001d65Q-1
X-Mimecast-MFC-AGG-ID: 8QsM_7VLPea6Fhv001d65Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56C221956096
	for <linux-cachefs@gapps.redhat.com>; Fri,  8 Nov 2024 17:33:45 +0000 (UTC)
Received: by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix)
	id 515621955E95; Fri,  8 Nov 2024 17:33:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.231])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C24C41956054;
	Fri,  8 Nov 2024 17:33:38 +0000 (UTC)
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
Subject: [PATCH v4 08/33] netfs: Make netfs_advance_write() return size_t
Date: Fri,  8 Nov 2024 17:32:09 +0000
Message-ID: <20241108173236.1382366-9-dhowells@redhat.com>
In-Reply-To: <20241108173236.1382366-1-dhowells@redhat.com>
References: <20241108173236.1382366-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lDjxQcbHxL2AiFsWA74n6Vu6beqRwtXueMLR56K_8sY_1731087225
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
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

