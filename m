Return-Path: <linux-cachefs+bncBDLIXLMFVAERBFNQ36VAMGQER7UDGOY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6287EF95B
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:06 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-421aca7f03esf30203901cf.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255766; cv=pass;
        d=google.com; s=arc-20160816;
        b=spoDirJ6kI3/StYB7cyv0fWmsiV9ZZwneEbvu2IMxwC6yKgor2JYrouGsvmcTunoQC
         AsQD+rHQ2QUK5zd5oB01affHc/BQk8CmxDHXJNqqri925ivp3rO3+Dpo3Y0c6AI3djkh
         QAXigquDYVRgyQW+vRNj4I5Ed1/IfckvEdgBhDjjlY9EE57t+CSOfSYm4lu4BLhXJqcL
         sDDyKmTtj2YSBC1zEcmriJFMFg7lp7Jmopbhc2WntiQvqQXtOBjuG2oTKvgSUU681EEl
         SPHjJWKOlHzoA+gvrLrafCnfo1bEx2/LTpaVKvEh1z4KdeYgtt/eETHodwdcN441UyZT
         9dnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=nDANHTjVff+Eq0Xp2c+w04s+UXlbRdMNGhoCMVl5CYw=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=t3q0mpk0uI7dtqEHo6m+35rvpE4U9Uthymiu3HTzclfWfn/k05w2rPsaAMmQsYjBTW
         U0EgylwOojfGRDF3BE0EMrikfvgvAHFkD8N3JimCZxOZmbBHyDYqndeTc1ubGIbVBX/M
         88R1NTpSpFX/+VXwJaa4gEz3IU3i3b2WZKw2b21Gl42q4W7FYQjCmpXofmP+5Zy4Srut
         NVmoHPb6+8CG9qhjShrQAUKpHrfGimTMu4QE1FXteF51qVexaVF+yzdRMvJHaVeB2ePw
         /2263NwlR3rAFy79F33ub3HViZj8jdBnY39aDTK1AY2IskAdtzicJIgJrTLwhWdb2u4O
         4ykg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255766; x=1700860566;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDANHTjVff+Eq0Xp2c+w04s+UXlbRdMNGhoCMVl5CYw=;
        b=uNcKVbZ9cW81FDiKZDh8+EhsoD0kakarHFKC7EiAcbz072t0N78OqS7irqxXMv1P28
         jP4eRZ9Q+KRbzZm9ToAYXm86HCHWfHIb0FNMlGK2KbGCl+sWdWfMblDUzBA16ZEuAbba
         TP2SSJ1N4x5oyBFH2KTmBFRE7MfdHBoMVdd4XAKydoi8Oq7hTFtbBNUp9WV4tkNiJayj
         oqeUc9A+fA/EOwSvL9nKgRTFt2gIrlGSyYl/d0AtKjp3PYEP9l02gStvWDsQOtUVbBis
         t2z2/57yytBuRdqW1C0JBJwcEFAtuP3FD0dgcI//ku1Z94Po8eLJwXbf7Zc3ELqw33mf
         lK+g==
X-Gm-Message-State: AOJu0Yzy+HmZsiyn0xeKadEBqY8Rce9JWKmg8Y0JbLqbuYU4wVUD2ISo
	Az5LtI6pjEvXwZ31h4XhuCF9gw==
X-Google-Smtp-Source: AGHT+IF/c+oHGb5MczAwFQuJ2roF/Mdh1mbt2Kq0cZV1MNVeaCgcsBUiW2AYBw9RgJeG84w7hRUrDw==
X-Received: by 2002:a05:622a:84:b0:41e:3d53:74fc with SMTP id o4-20020a05622a008400b0041e3d5374fcmr937502qtw.49.1700255765813;
        Fri, 17 Nov 2023 13:16:05 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:20c:b0:41c:b879:6082 with SMTP id
 b12-20020a05622a020c00b0041cb8796082ls2203130qtx.2.-pod-prod-09-us; Fri, 17
 Nov 2023 13:16:05 -0800 (PST)
X-Received: by 2002:a05:622a:13c8:b0:421:c3a9:1e4f with SMTP id p8-20020a05622a13c800b00421c3a91e4fmr1019545qtk.7.1700255765254;
        Fri, 17 Nov 2023 13:16:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255765; cv=none;
        d=google.com; s=arc-20160816;
        b=GXq9Etp552eR/OOdCJy3U/hcaUH6aSLZN7jmnsMTLIZRGj99eaSxvqbq4dOVQB+tmg
         TRKjSoc2iNwMdv67fW5dHz2sn5FvQToBUMkQ5U4oNC3eE8crw5OkRc1J6mw4ORvJWiY9
         6oK1dCg2ekMJTFUhI11PBOAfLJh/NKYoHRuOukD8aW7tldQLy7JBqlw2n1zLFV/xvhRd
         0zbCqX0kGeGOBbeTfAAS+6RxRaAXYL5ZMUQEVo50/0g08HX+TMTzRKoHfUf8Im/Nz8Zn
         tYZ8GGnaYqMcO4j+rWJ1tvIiyrxaU2N9XhRay1ad3tpKC9yNGg4PQP8IX/w/GOQ+YouJ
         COTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=hEis0LpqHig0B1ZU0ewbKxCSS/w/yhv1086SqFY6jkI=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=D570tkhAGWWve/edlDq5eFRjk6WqjRU1tBXmmHOTUEGqQPDqEFsUE9QZ2P3kBlwEXj
         Y44U32SJp/0YyQDCEd2xenqTUY9a0Rsmsi6uAOUc7SMAkUaK1FVTxwb12T4TNsHOf0X6
         qea+9EgaXULfhUX3zU8TL/dtCqLL+GmdF52A/N2l9I4xPCDHfHqUBjrL8Rsi47jgdDFT
         uN7p/Q9OGeNhHYiXAHpkXXLZ8KfJZ8s1RJVy8UAcsypn9gtrSWXrVHUD1itkhESEvlnf
         KsdsUH5oivDvye9ArLZGPZbjEqkeI05GYEtmd6Uj6nHmSYVOldLbY9KV7fNr1tYeQ88G
         3Lfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id r3-20020ac85c83000000b0041cbafcc5bdsi2383104qta.121.2023.11.17.13.16.05
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:05 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-WP2-ZZYFMfKSjw1qyGbbWw-1; Fri,
 17 Nov 2023 16:16:03 -0500
X-MC-Unique: WP2-ZZYFMfKSjw1qyGbbWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE96C3821341
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E8F0C2166B2A; Fri, 17 Nov 2023 21:16:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52EBD2166B29;
	Fri, 17 Nov 2023 21:16:00 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Ilya Dryomov <idryomov@gmail.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/51] netfs: Add a ->free_subrequest() op
Date: Fri, 17 Nov 2023 21:14:56 +0000
Message-ID: <20231117211544.1740466-5-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Add a ->free_subrequest() op so that the netfs can clean up data attached
to a subrequest.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 2 ++
 include/linux/netfs.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index c4229c5f3f54..1bd20bdad983 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -145,6 +145,8 @@ static void netfs_free_subrequest(struct netfs_io_subrequest *subreq,
 	struct netfs_io_request *rreq = subreq->rreq;
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_free);
+	if (rreq->netfs_ops->free_subrequest)
+		rreq->netfs_ops->free_subrequest(subreq);
 	kfree(subreq);
 	netfs_stat_d(&netfs_n_rh_sreq);
 	netfs_put_request(rreq, was_async, netfs_rreq_trace_put_subreq);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index ddd55b35e650..0633cd9644e1 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -216,6 +216,7 @@ struct netfs_request_ops {
 	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
+	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 	int (*begin_cache_operation)(struct netfs_io_request *rreq);
 
 	void (*expand_readahead)(struct netfs_io_request *rreq);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

