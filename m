Return-Path: <linux-cachefs+bncBDLIXLMFVAERBKEZ46VQMGQENXZWK6Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mail.lfdr.de (Postfix) with ESMTPS id A560581162C
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:24:26 +0100 (CET)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6da070c7f3csf1083987a34.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:24:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481065; cv=pass;
        d=google.com; s=arc-20160816;
        b=aD30vLaSzkCjHc4YzQV9FzjA5Er7jtHdifywkvbqfyROym81g/hxo2vEoG3A5S/FQG
         Y6xxu7fMRCezI2DqzVJh6HsnEEZhVEy+ptE/+xjGEx+4RokS5OHi2koVrVBNDBUsDIxL
         5jnLWmbHvpXUahU+dWSg7IjqrI4l/krvXdj57svqqia7LiOrNxgFHqbrYc1PHW3bSCpv
         SlJam247YhSROowhwIxqrxXBnUwjDjfbd6d72WCUI017b29SyCGnca0rQwlMw+VdhZCO
         QMooMvYiLo5pFHCbG2SUhw7NwiocxIX054rh24fwqzJ9VAWHFquHUAh3T8d6gpoHNmU/
         UyOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=LLOPmn24fD8ychxqBPm0k/loUGGaoX3Y4YWst4+LyZY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=XPboWp3Uq5n2ccWG/n9x+ChdkehYcHct2FDj6D5Lh1MPjVf11VMpu4KKratsP2w706
         7xwXoEAL5YXXMcB3Jg8fa0j+HS/bmqUb+GgrLifC++p+t53sCSnVHXk9Egl+ZGfG9nqh
         Hbi6GJTtdb5CGCDBtN9xjC2Wd6VBUYyhHKYW6ts13K2atMw0iadxztzUQjPhnJaVr/Xz
         DPeMG7lJVc9fIZ4SK/IiT1xJPuuJXXt4m3pUwGX8MJNR+RzgUoohb5SjTfmjfLBgdzR1
         9Z0Xy6qdlFtSBwIb7Oqv948RBqYU7Ki6IN8g6Dd75M0SwD7a34S67CrPwncD9vdjStNd
         V7rQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481065; x=1703085865;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LLOPmn24fD8ychxqBPm0k/loUGGaoX3Y4YWst4+LyZY=;
        b=UQ9F7UYUZ8hU80VlAF30ETcrzDe+a1mAUkKy9Xa9ho2WTUUlha4wcAcwDFx5WBRwT/
         w6O+He2jzy9R/q/qoQTgreCRvTeAUPnjJ0MuG+NEbULcI4XUaOrwqkS0K+E6Mf1T1F1W
         0J6dZ5+3CU6xGtYqfeziteKMUdeEKh7RDXUJnlsKQmAf5Oup6Vt34Uov8W44MF/NDT+t
         ddpCkUgdrj01KctHylFz3GLXaljsPnqdbHQKrKE5px+zikBC760ims12KxPdA19dGwCd
         0GXly7TE+VKyxCfgOfChDnXLD4wJcw++M4CjZjQjO/vZQW8ixxCfZE+SFHDE7xTEqSGN
         A6xw==
X-Gm-Message-State: AOJu0YyubygMHWM46gE1eAQVl4Kex7Lsyvwx+ItuEvFZR6S/62Ivfvjy
	rzjkdssbcIyWY2XTA8nfKK4POw==
X-Google-Smtp-Source: AGHT+IFBJmGmJZ6enVdMK9dUOb6rgtCd1vP/JV3Owr68SJm35xXzcAd7/xH1D1j+sJhlLuSrRSLLHw==
X-Received: by 2002:a05:6870:79d:b0:1fa:60b0:9d9 with SMTP id en29-20020a056870079d00b001fa60b009d9mr14108170oab.1.1702481065079;
        Wed, 13 Dec 2023 07:24:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:c45:b0:1fb:3148:c486 with SMTP id
 lf5-20020a0568700c4500b001fb3148c486ls3451159oab.2.-pod-prod-04-us; Wed, 13
 Dec 2023 07:24:24 -0800 (PST)
X-Received: by 2002:a05:6871:e407:b0:203:1696:1dc7 with SMTP id py7-20020a056871e40700b0020316961dc7mr2142962oac.10.1702481064449;
        Wed, 13 Dec 2023 07:24:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481064; cv=none;
        d=google.com; s=arc-20160816;
        b=r8JisNUb+ME9M+urvpmZt0AqV/ayzTPMX2uAiFECRMmMFSnnZnGSCXoFVzCp/jHnBh
         v68ob2Ss/jDXh7O/PuozmMKNdZw9Q5iUI3pMHNEYP0wqhAa45nwFI4v+qF4X7inH1aYc
         TuOcIZp3MQ770scwyXQ0VCrmCwoxp/qyi41IK3sgimBh7vVCbD/PMncxShGE3DhMUrNy
         tVtNRjP+zXAp9kWKgdpUR/SCyHRGXiAI/7n6o3ev6/oR50zXtusHNPHV6NZtiNM/5yvI
         uLGkcvGMQgxikY/UGFJHxRl39C/zag7UMiTySDkwMNsp0FoE5vRlaONu4O/nrNr2MQgM
         qVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=4hViO3AGp6pToaoN8VF8Iwb+OF6je+qeF4CeyLwe0vY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=VQyNmOxbflWstXONIk6cyZcsYOEuVhwD0BG4kBzl0+TyobH+cXSDda66T/YYrLvsDG
         1t99aJGShqiVODMNnq1K6fgfUDNpZBloTEDe75r++DjPHcVwY/bKxZ1hSMhxswqN3Ii2
         WMWKmyo30K6JO6ix33rDHqGaU6s7cMndxJoExsL9l2ewo154YoDkeQUenuVPeGZ6pb+F
         LoWy4axiAemLcvE9X99gXuKZ6slgbDLRGOBRLbnB+cpheyH5NmlUHHvlqykgz48jns6A
         qvsR1TS4cIj0XckrH6H6uKWrauXBWbjaOiXXTGw8TGYjhg8RHFv8Gm3NyKCC2hrm3An/
         G94w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id fe8-20020a0562140b8800b0067a97e5817dsi12824390qvb.557.2023.12.13.07.24.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:24:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-G3WkxEQ7Ojq4dMNKfrrj3g-1; Wed, 13 Dec 2023 10:24:22 -0500
X-MC-Unique: G3WkxEQ7Ojq4dMNKfrrj3g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28ED7863027
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 24364C15A0C; Wed, 13 Dec 2023 15:24:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F10D1C15968;
	Wed, 13 Dec 2023 15:24:18 +0000 (UTC)
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
Subject: [PATCH v4 07/39] netfs: Allow the netfs to make the io (sub)request alloc larger
Date: Wed, 13 Dec 2023 15:23:17 +0000
Message-ID: <20231213152350.431591-8-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Allow the network filesystem to specify extra space to be allocated on the
end of the io (sub)request.  This allows cifs, for example, to use this
space rather than allocating its own cifs_readdata struct.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/objects.c    | 7 +++++--
 include/linux/netfs.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 85f428fc52e6..c4229c5f3f54 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -22,7 +22,8 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	struct netfs_io_request *rreq;
 	int ret;
 
-	rreq = kzalloc(sizeof(struct netfs_io_request), GFP_KERNEL);
+	rreq = kzalloc(ctx->ops->io_request_size ?: sizeof(struct netfs_io_request),
+		       GFP_KERNEL);
 	if (!rreq)
 		return ERR_PTR(-ENOMEM);
 
@@ -114,7 +115,9 @@ struct netfs_io_subrequest *netfs_alloc_subrequest(struct netfs_io_request *rreq
 {
 	struct netfs_io_subrequest *subreq;
 
-	subreq = kzalloc(sizeof(struct netfs_io_subrequest), GFP_KERNEL);
+	subreq = kzalloc(rreq->netfs_ops->io_subrequest_size ?:
+			 sizeof(struct netfs_io_subrequest),
+			 GFP_KERNEL);
 	if (subreq) {
 		INIT_LIST_HEAD(&subreq->rreq_link);
 		refcount_set(&subreq->ref, 2);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 7244ddebd974..d6f27000eeb0 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -210,6 +210,8 @@ struct netfs_io_request {
  * Operations the network filesystem can/must provide to the helpers.
  */
 struct netfs_request_ops {
+	unsigned int	io_request_size;	/* Alloc size for netfs_io_request struct */
+	unsigned int	io_subrequest_size;	/* Alloc size for netfs_io_subrequest struct */
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
 	void (*free_request)(struct netfs_io_request *rreq);
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

