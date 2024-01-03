Return-Path: <linux-cachefs+bncBDLIXLMFVAERBBMD22WAMGQEPJKPQIQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7FF8230C1
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 16:47:18 +0100 (CET)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3bb6a1ddaf9sf10479114b6e.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 07:47:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704296837; cv=pass;
        d=google.com; s=arc-20160816;
        b=ONC4OBHIwfuekBgfLQ8566DgpDcKKNebfnDw/M4wLtbuvxy7fB5KUsTBFCXzdIGMRL
         skxBFi4PV7PQJHfTMSk1YNEK/GaSGcVWSc0PG1d0siJXdAJw12e8MQZ6lfrzha8Qmdy1
         /KtySQVk2Bw8shAcFCGW7YLkc70egr8je4L8vJPx8UDV5u2kumJTp6LZRNLaEwcRljei
         dFrxO5W8J5KpMCSzfbkWsl//R2VKiqbN/Vo3oRO+LCPBfdHFl7uvb4dER0zprE3U07TV
         Z6Yq0G9dNKS0cr0IrJjnKsDwbLgwd8+2E7r4blxbyhkOZzYeMUgBGrBta2oNlrmVG8/b
         HWxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=KVNMobOQDT/KRFBhOboWq4b8Uh45fRRjzk6tBM59Kpw=;
        fh=QZlVHPyl8yYa5caLwIeYCrH2oilTyNh0FuJMluNO+3A=;
        b=KDe5oY4yHgmLZMODRuGBawUTXTXizs19N6sWRClNH/xhYAaoUUyr0c2LsXGjPJZ7Xg
         vDRr8QGNHwCAVevDMplwYsk0xG6+2zyq+ksW+4xviu/5sBFo1gGDDEF6aaSm3W0k1uKJ
         gEKjtqEqiND1Y6N2+CQPtDYhDYKJmIrq/O/6PDj4fBMur4rA+6Hyewfuz88a2o9PwyOE
         SvT2/6lbp8X61QUgcUYd1izAZDrcqbj4AeiT0zS6e2XDoWwzvIXWFatNvs+tL68Mc0/S
         qcjk+d3LmTOh2joRK9/dCQAQaelk94UDmqctTgkjoZ23VGlcYhDxnimYxpnFgxER9kst
         8Nmw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704296837; x=1704901637;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVNMobOQDT/KRFBhOboWq4b8Uh45fRRjzk6tBM59Kpw=;
        b=ioZk1mKuJdj4/vsHYk4HXtN1isX+3J7rq/PvHwTgTrQWcBCNj79HJBRhpiIrcMV8Ol
         JxSEqkscUJ0BJe/Wcb0ewaPNMzC3EiClxGsHzPOSe1WGCKlv55HoyF6DTjHboAox5JI2
         FwI+58mvVQ+K06KKCDTYRVpXO7IY38Oyv6rB7W5pnhUXPd2XjgAGV3PxK6STj2xJSwOI
         uCvFHJ3mu/jSqCKEZbzc7hlEBRJSiMl+bBr2YbfLNP624qVnHqTQWRgHhygqX1wNoSoL
         OOLqqJ++ENKef6TpgVv0iU3869JjK4fx+U4741KsB4Rhm1oPA4821Y3GdxtAoGp5FnP7
         A1Dg==
X-Gm-Message-State: AOJu0YyCd/RpW6wfe5oAU/VMVCaC89yXdIHorqmzOwT4vZLm+IMsrHS2
	On96AuTQcNshY3oW02dDPtI0+CuUoxdMQA==
X-Google-Smtp-Source: AGHT+IE31UIsF0D5a7nIe+aVKHDejtAperpPYnfnZVPU6Y4jKrPwN6jlHdyg7EncGHaEdcNIVri93g==
X-Received: by 2002:a05:6808:8f7:b0:3bc:1a6c:de02 with SMTP id d23-20020a05680808f700b003bc1a6cde02mr2043260oic.32.1704296837286;
        Wed, 03 Jan 2024 07:47:17 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:ed22:0:b0:680:c838:d067 with SMTP id u2-20020a0ced22000000b00680c838d067ls243758qvq.0.-pod-prod-02-us;
 Wed, 03 Jan 2024 07:47:16 -0800 (PST)
X-Received: by 2002:a05:620a:a41:b0:781:571a:a5c1 with SMTP id j1-20020a05620a0a4100b00781571aa5c1mr13565284qka.36.1704296836534;
        Wed, 03 Jan 2024 07:47:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704296836; cv=none;
        d=google.com; s=arc-20160816;
        b=XLUoPZA/CUfJqlt5CCEgoea5AfB7kycOQrpAC8k368yUVsbA08ZLAAGKAcyj73QMZe
         r1ukQiM+Un6Hlu+gnKDwOkCiA0qD2t9PgD1F+eCMfrGp8VRlmXZfR+FSqaK95AjNYi9B
         HE0kbv1lPB0Qw0FD/ClNtHcnMHce8hJjvnxFRLpO8XR7IcSBWEFmB9n+r3J95lDOtgyn
         r5D+zDzKe0zQy7ObrQ8m63oaBfSNH+fp7kPQLcC0WHf8dwWw6TCabLK4I1GvzXdQ6GCV
         +/VqCgqL1yf3vCur0PbUj1F75qlHDCcQrLfDr+JlfqnTsfCaR52gc4LwdXobGdVWLS4e
         ww+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=T4zshVgbXU4KADwit5ys0TaPmzA2s1+8lP1tq0kT5oQ=;
        fh=QZlVHPyl8yYa5caLwIeYCrH2oilTyNh0FuJMluNO+3A=;
        b=yeufPyohbpXlvI41FPNXGO0MNlhO145eSf6TMBF2P1uSl14FuUSMOBjoKZmyxMKv96
         7X73X2FGgd+0Zsgkp/EWJQ6YghaKDzVHvidw+LsRRFGGURM8+i3/JgfYIVIM4Brlrfco
         h6mwyTiGNTaJg+5lmkW7yf1u4UJIMRlMwd86hIA1IPdBbmfEpL5RyxyrV8foqoOXzlV0
         6GWSNsbGy3TLjdu6YL78wMP6QYqjEcLwjjiKC0mrBb7rQu2CXoY+7q5+W56VHQQ5f/t3
         PPJlj/QO83O+ht+ZGabb9G8a/hyU68jy8atwtkBYS7E4LQVcX8NKvw95SrrX9SXIILXK
         nCVg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id qs17-20020a05620a395100b00781706eb820si15102173qkn.196.2024.01.03.07.47.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:47:16 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-472-D7bvTFWYOYGMX0jtgM_T_w-1; Wed,
 03 Jan 2024 10:47:13 -0500
X-MC-Unique: D7bvTFWYOYGMX0jtgM_T_w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAF6B3C02B45
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 15:47:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A5577492BFA; Wed,  3 Jan 2024 15:47:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6923E492BE6;
	Wed,  3 Jan 2024 15:47:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240103145935.384404-1-dhowells@redhat.com>
References: <20240103145935.384404-1-dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-erofs@lists.ozlabs.org,
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
    netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/5] netfs: Rearrange netfs_io_subrequest to put request pointer first
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 15:47:04 +0000
Message-ID: <396881.1704296824@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <396880.1704296824.1@warthog.procyon.org.uk>
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

netfs: Rearrange netfs_io_subrequest to put request pointer first

Rearrange the netfs_io_subrequest struct to put the netfs_io_request
pointer (rreq) first.  This then allows netfs_io_subrequest to be put in a
union with a pointer to a wrapper around netfs_io_request.  This will be
useful in the future for cifs and maybe ceph.

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
 include/linux/netfs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 852956aa3c4b..d3bac60fcd6f 100644
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

