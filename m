Return-Path: <linux-cachefs+bncBDLIXLMFVAERBHXZSCWAMGQE6VPYYCA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF581B757
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:47 +0100 (CET)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7810a048407sf296194485a.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165087; cv=pass;
        d=google.com; s=arc-20160816;
        b=ftQNe6rTOnFSUpik6W0lOoCheRW9CsLFXs9s07PT5Wxh6AxiTgHhk4I19elBsrWZi3
         k8YBqw/I1t7gRDOU76GI6nEpA4U4H2obc9QXG0RG2DlJb090LtF7aauuzl4bSADcfZH4
         8pohGRLS9PwVj+QwnVPzdW7qHNE8FlwW3esa6pEGddfEWWzVhggDbCLavUJDTq6eb1nk
         5GPP6VMaakycAaaIdF7wKbemCDO84WfI4lW3M8rRVwQLmySgwuGfzZtGooMYbq1/oLIY
         Srlc0JP6yF8o3sbU/Hxcpkb5GSxeEuFuBVv/ZoGKRYKpVggwDIpowjBIzGufIWbuOWAx
         v+Kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=AuUgnaFNpcuWXwr1o1Rq59voTFFYAcIYOOqYQ1U8vwY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=eWAxl6FcqXvonREpglTYCupcza+Bsfq0oikyrV4uIKkg4GCrFVmiJl6GB8VCfQxsGS
         P5pi0pfOB7LT8R0N3hSXEaxN9Pum4wNsL7lMP+aI5hjYab5YJ6Y9kbPMBNBWC5RqqAZm
         Nqie3aCh6q0otc14Mx8SVDAvkwbzGfz87/PXS6MfstPkka72A0Wytu14T5wLabeBYihz
         IHrK924BNU3SkqG+n3iUi9UHS8+2Erj7Ms2d5ejAEKX57gLAMNKS/CTkFCV0dYB6OAzt
         JzbcWSb9gMvTcB26/xKSHcytt2SoJgzuCl9p2uHBDpbinBzHuGvEP3bVkeSj931fVIIS
         Y1bw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165087; x=1703769887;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuUgnaFNpcuWXwr1o1Rq59voTFFYAcIYOOqYQ1U8vwY=;
        b=UEVjWGVtB3hRxlEif6LdlKuzKUhEpShYXvUQE4TWAe4LNsoTMsGxBEXvrmU+/3l8BI
         yd9m2bG1o3ARAGhjaS3sv752NhSLoM6QKNlcZnFOO4lndm6lEOqQef9QfWanhG9xD/TY
         dB7LTRJ1wtkyQzMcfMoyrasoTJ+fMoOrwBivu1d/L+ejaF6T2yvKWcCgNVO7RAGMKRd1
         2JCjqshFnsXekCTYS0hr4avm08Ut1Agh141fI38NDNIAWo35Mrdt2jg5LBewDGdqttoM
         P9lmImuK/4a0XSslfmFnCt8QCehB7VEb5Q877aG0NR9XLaaKWDatXnpUO597IvitjvUt
         NisQ==
X-Gm-Message-State: AOJu0Yyrb3rInPuUwwBI5pxV41KCjxr0FGCTS393dRebM9ZlFuoFeSVK
	8oUwhUpzA6LxhifKxA7GrQ1zEeazSfcNTg==
X-Google-Smtp-Source: AGHT+IFWPcayiBwhXAgjwi/HoXm/y9hYTSaTjiu9T9Whoff5eg3u0PMGpUHv60YGclMON32xDJbU3A==
X-Received: by 2002:ae9:e911:0:b0:77f:2d6e:98f8 with SMTP id x17-20020ae9e911000000b0077f2d6e98f8mr850486qkf.5.1703165086774;
        Thu, 21 Dec 2023 05:24:46 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5f4b:0:b0:67a:9173:54f9 with SMTP id p11-20020ad45f4b000000b0067a917354f9ls108310qvg.1.-pod-prod-00-us;
 Thu, 21 Dec 2023 05:24:46 -0800 (PST)
X-Received: by 2002:a05:6214:20c8:b0:67a:a72d:fba6 with SMTP id 8-20020a05621420c800b0067aa72dfba6mr1095267qve.36.1703165086223;
        Thu, 21 Dec 2023 05:24:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165086; cv=none;
        d=google.com; s=arc-20160816;
        b=Yaq+DVZ1AepBlvQ5F3BT+uJ+dodFMYiOPiHFoMC7zUlNskN5G+fXbuerrBGRZqhRwt
         V5qmrm6zjEN3HNwHEeNOJCbui9/F/KjfwQQlHQqfGUUbidoneZqoOEhAhMRqt4aSZE9l
         sAHrb2pFGMQDGhdOJixClaiF0Z2wvBnaXzSVS5Rorll/4vhLNALEembKsvS0QNVUpy/v
         BqDGJ8J5fW7ino9W4ZoiC/KDnPJBns0xGq1I9bNlp5RqAAMVJhlxN2F5WUAABxTEGNaN
         Wp136YsvZnhI9v+UP9LXZf0ZyHhAQ1zyKM4KzvKJtdAZ6qjXvP3eC9qvpYauLslHhHTz
         ha2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=H0vMMTudDfb6r/qBW0AEkSH7nAY0KYX4o9qMLzBZ4rg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=uQRyozRS4wxzfez3L7lWCuZ60Lf8+1dRch4vm5MLFBoOBwOwxCHj2m5PvthY9gJtxJ
         /mPoiSfL3DeSR7gp0ETL/r9sDiUDFX6o3npSoLi8luHD140MKSxNGbX1Xm4SCSZy6Lbo
         Zlfos7ct7eeTenYQxyEAnzMhs+/LWqvn6QkLy3XQ5Of936XTMk/9VZlLoSczOCKNrYw6
         DWX5+6aGZuWEBF8Zi7bF41Ml+ouX2m9YTDiZqUjRnERkkBJOK0nxZihYqziTyQSXfWI0
         TUtmYzLUtIrofyE3CQP9X9QDiyKcBR0MOpFChTiSO3ooPFy+flR1Z8Fu4XgJXOPd+UE3
         /pFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s19-20020a05622a1a9300b004259cd2773asi2188309qtc.94.2023.12.21.05.24.46
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-hZ3N8Qj3NyC4nC6YbpYmtA-1; Thu, 21 Dec 2023 08:24:44 -0500
X-MC-Unique: hZ3N8Qj3NyC4nC6YbpYmtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12B28868A02
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0BF842026F95; Thu, 21 Dec 2023 13:24:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 214632026D66;
	Thu, 21 Dec 2023 13:24:41 +0000 (UTC)
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
	Eric Van Hensbergen <ericvh@kernel.org>,
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
Subject: [PATCH v5 10/40] netfs: Add a ->free_subrequest() op
Date: Thu, 21 Dec 2023 13:23:05 +0000
Message-ID: <20231221132400.1601991-11-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

Add a ->free_subrequest() op so that the netfs can clean up data attached
to a subrequest.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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
index d6f27000eeb0..06f57d9d09f6 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -214,6 +214,7 @@ struct netfs_request_ops {
 	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
+	void (*free_subrequest)(struct netfs_io_subrequest *rreq);
 
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

