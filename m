Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQVB46VQMGQEYTXGY7A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CA3811792
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:41:55 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42599db593fsf99364621cf.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:41:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482114; cv=pass;
        d=google.com; s=arc-20160816;
        b=kZo5nPO8aE4Jos8eDVYDHfWm/bHR/kx7D0zGlfoFQO/n8pb8cUWIyfJGOXexqJsUPJ
         3RCN2gAn6OhmhMS2F5t/4xV8I9lsbrVgNPb+GINbQ75XQjyP4xNlUHGfTgoCtxxML/1L
         5D5UVgTgxNWbp6cZmorsp5tj+iBBpmgdWkysnc9mfswvffdBENuwaTO7jsEWMMQMeOXC
         07NoM2O6WMjK21j4/4mnfxHKw9cv4nGi8bxsID3ThJtprSm6Zxt2T3AwmqvgnEiKimeq
         IFez2GmsJau+htuRKHFeGQYRStG3GeAFFfejWK+oPQ6Hi6wkr5WKW0ZLNGlKa0LCEJG7
         Q6IA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=aBF98jWjx8J+haGagfBa9suhoq6+KT4Z65BvQTtv35w=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=q9KbWZlc2NnQJnhO8ZTOBt59DVHzdIRA/hZQuOCmj03E2XEy29FDIaWRHnNRr2pqfH
         8I9gdCUFpOni6ZAkAQb9gdayvfsB07UmUUDZwXXWe9snTUca8R6cAndJ9X2ce8Gf//yP
         rnw68xew+dhiGzD3uUJFdIjAyTlD0molISgaH/mcIV0gZy8ABYoSCumCVteyH9M2mX7n
         3EEuP58pkiE7lYh6kDgmI1oCPWDLw6ZXSkBL4u2gVm5ElmvmgjkRzOYni3M4eoM24aLV
         MN2EaUZn2aiD36Curat2eqm1v6jIGKMynpnjAktoOP3qqUE42a4oLkoE0YUUZtb5QdId
         Etrw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482114; x=1703086914;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBF98jWjx8J+haGagfBa9suhoq6+KT4Z65BvQTtv35w=;
        b=T2i+ZRK/on8pH0sfSpz9YN+ND3E5/CO0MwxWWiHBD3RB5yyD7cxF/8Lj3SOQgDuOxT
         h6UWFs6Rn1mCiN9clWBABWF/nTh7tSrveQ2cOakhxjTAN9nH+1AwYG8Nb9G5ZCz/AAKK
         EBJKceBvNFiFp9qXYuBJymH3oTqTq52OIbXGgwAI/digGnU1tUuvrBrA6ccs/eeUFc2E
         +91jKYBUQ65xTbmrQmP8NG0UQia/JMD4zR+eH1BCOjY7rKaD/idXveWVFDARYjNhJzXO
         Z3QB1zw2ESMJWOXdAHEW9vrQRnNvQgV+uxcba4EWVigWz4iwHRo7O895+bYHZMiiP6Q6
         olow==
X-Gm-Message-State: AOJu0YyGWRu9OIH1GFKYMOG/skX0ZdNCLCWmFDqVgpXG09Mhn4f35o2q
	mgGKlCsTmK13PpO6sK1j63ycGA==
X-Google-Smtp-Source: AGHT+IGyVW2uBuXFqbaL5N5PF5SrmzQuav3sYtKjwJya36sUXQm2xjVm1uVPVALpMNiFhBuubN0DLg==
X-Received: by 2002:a05:622a:15d4:b0:425:4042:f449 with SMTP id d20-20020a05622a15d400b004254042f449mr10605525qty.45.1702482114560;
        Wed, 13 Dec 2023 07:41:54 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:199a:b0:423:707e:9eb with SMTP id
 u26-20020a05622a199a00b00423707e09ebls585050qtc.0.-pod-prod-00-us; Wed, 13
 Dec 2023 07:41:53 -0800 (PST)
X-Received: by 2002:a05:620a:343:b0:77f:1654:5803 with SMTP id t3-20020a05620a034300b0077f16545803mr10884080qkm.17.1702482113339;
        Wed, 13 Dec 2023 07:41:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482113; cv=none;
        d=google.com; s=arc-20160816;
        b=TkGYAFdqUq55ZJZquW9pr5SfOHZk3XLdpTeSilZCrBk9mc7UkGEAhLb0Gvg3/0OO4l
         QrAJqp58fjwX3GGbLiac+9eanp58m2+PnN3IM+kPgDclGNMCu2J/arD2bd3aLWnUCzPg
         GA3Tbkb7oe54YS7GCKPtLCPGIhttLpaURX3VlfQpvoqcCUE2Uq8I7FRl+146mHjDMqSk
         5ldpS702Kd8z04IPYZHwCcs0221oaflLqSA01Q8secsFjjOa3YLcKLiHgrF27fzYAB6O
         CQtjYmDS9xdBHs2o0dbjTASBXUW3bLp9ZNdRZmboEoSReatKUwqJ22rpHm1WDJd3LEdL
         cGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=jdMK2KsBWpd3n96cWJQ992Ioikk1fLU4p2UyRf9hgqM=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=Dpfunx1J5PH1Zcc1vMrDp81cF1V895HvMz4p5A7Y9oYbUA0mpH5Or4KUiy9RLzZkNp
         JJSN4zllY4qRhE50OJCast2NbKtARk63JolQJnOsRMOX2a9juUa7sRyTF8DCRsIJYrc0
         N3/a60B9/3Izsa5MtQ6jcL6zlPLVqvUsKkH0f6z9MzWM+ENj5WQmizKB/Aa+dk7ROAfM
         GOm3KkEMM/ajhc1VL1yNMTGqeVnbk0LnP7SDQLn+ZXWE7PGOOfiE8paEk+91T0KBlNSV
         7v7sgPg4yfDGmPVD24V8JrdjCQoQY23EQF8Oaw7ovdHi8kEnf+UiVhqjYQE1o3JlAgaq
         gWIg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c23-20020ae9e217000000b00776f2642d26si2425190qkc.729.2023.12.13.07.41.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:41:53 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-602-Y_ET9v-RM_mPGy4owsSz0Q-1; Wed,
 13 Dec 2023 10:41:49 -0500
X-MC-Unique: Y_ET9v-RM_mPGy4owsSz0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91B4029AC03D
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:41:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 8E3E25190; Wed, 13 Dec 2023 15:41:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E92851E3;
	Wed, 13 Dec 2023 15:41:46 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v4 01/13] netfs: Rearrange netfs_io_subrequest to put request pointer first
Date: Wed, 13 Dec 2023 15:41:27 +0000
Message-ID: <20231213154139.432922-2-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

Rearrange the netfs_io_subrequest struct to put the netfs_io_request
pointer (rreq) first.  This then allows netfs_io_subrequest to be put in a
union with a pointer to a wrapper around netfs_io_request for cifs.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 include/linux/netfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 2005ad3b0e25..c927df141385 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -204,8 +204,8 @@ struct netfs_cache_resources {
  * the pages it points to can be relied on to exist for the duration.
  */
 struct netfs_io_subrequest {
-	struct work_struct	work;
 	struct netfs_io_request *rreq;		/* Supervising I/O request */
+	struct work_struct	work;
 	struct list_head	rreq_link;	/* Link in rreq->subrequests */
 	struct iov_iter		io_iter;	/* Iterator for this subrequest */
 	loff_t			start;		/* Where to start the I/O */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

