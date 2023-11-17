Return-Path: <linux-cachefs+bncBDLIXLMFVAERBNVQ36VAMGQEGQAQIHA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCB77EF979
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:40 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41cc5b9d26esf82400901cf.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255799; cv=pass;
        d=google.com; s=arc-20160816;
        b=CJreGZPOnbh4cYdJI4aZj7xCkaEF5rhl2Y6tiPpONVIAxULDMibB/nGv3FN7mEGY9G
         PeXgg8Z9UmxRuCiPFhRa28+3IjYBWiZQYa+a0uRgrE8EcoKgE8ClMRL657Gorayl2JFW
         E1/iA+KUMlwJpwjTZlnbOtJ66zuxfetrYrft4079MDjIs4ZzUJl+RF72RWbSCoTfexP9
         cTT9LcKo6K7yJo88LDXu/GdnYSXSgm9DNvYZLZDClyZK9b9jecQqxyGuuuLQlVbny0kE
         lMg5V5tvusA9YKwZlo1vaw0Zb7G2ntEbgtZKy1iPcGKNBIWXgdBBdH0ixOarGivFcvwA
         uUeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=BvmOXTnj9odQu1QFbklcKzUGMLnIl+bv7nii2+eNgfY=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=B4/iH3qmPgGhBfkr4QMXjgIYaT+oU9XokgjysFDTxmzyQwcRm0gp2JDfV5SnBZU5qQ
         tyzHItwHNrS56BXo1tOz7iVuvBhLT0pWqT1ENxdd7Th7bsvbGFoJ7pPWcEBFVA+IsP2B
         IGFM8FcYHt3uXkfWZU/LT5ywJdv7ycNu61QNtr8/GUaYGyK73/+/Dgeez/Slhb3q8TAq
         vA20EEN5XXGLESQYN5xNQmDsB6JrXNKwa++7yklc90aSY4MauWO+ParSCxFQaT5QUq0y
         b2dU+bhPrC9mz5ST+70s3OV6X2hIzuCbbV3LDTbWeHK2PS6As5QPB4rL4OO/xAwXbeK6
         U0Dg==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255799; x=1700860599;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvmOXTnj9odQu1QFbklcKzUGMLnIl+bv7nii2+eNgfY=;
        b=MXscopjlvv4dRr5Aslq8WT487Cl2nTp+/JFBDG6aVVE4j7qfTyULvSwwsQ5dviXI6D
         3ZLU4F0IQlLuiplQW5fJjcJeF5zIlnSuvEzHGhjyQ+y7MIn4n7+ERh9dRczr36A1dFLK
         5tlS2bBuHMRMJw1Coauh8DoPgmgHTjY2Oco3mRdrJAQ4yBYebj7qey9MSNjHUlt+SotB
         vHqdFCJsK3lwISaATWTJxdPzxoHmUeEv2sDqI7TdcGfrUAxZC7RoC9m2dPk3C5x3+l80
         Z+DjwNt8Ou+h5M/bTSMkH07ESu8koCVcqUzz+gQv2TrEKsZ0kA104TLMUK6o5HCfOQc6
         Nhxg==
X-Gm-Message-State: AOJu0Yx0WgjRm1xd8M/huIa7DPDq/53w9HioEqNFcNZKsOVm5XdxiNVO
	Z0qfWhOM1Bl+yq19Q2jIO1yd0w==
X-Google-Smtp-Source: AGHT+IGdpNGTI8gqXI9xcMIPRWUwlHL7qpGyL41x23+encuAb7bBHQVNgNCK3ShsjW2tYjt6aqFLFg==
X-Received: by 2002:a05:622a:190:b0:41e:322c:aa66 with SMTP id s16-20020a05622a019000b0041e322caa66mr670414qtw.7.1700255799057;
        Fri, 17 Nov 2023 13:16:39 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5704:0:b0:41e:89da:a6 with SMTP id 4-20020ac85704000000b0041e89da00a6ls1415279qtw.1.-pod-prod-00-us;
 Fri, 17 Nov 2023 13:16:38 -0800 (PST)
X-Received: by 2002:a05:622a:1748:b0:412:3d25:9019 with SMTP id l8-20020a05622a174800b004123d259019mr780658qtk.6.1700255798479;
        Fri, 17 Nov 2023 13:16:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255798; cv=none;
        d=google.com; s=arc-20160816;
        b=CI50+XsWywsL59Knl2M9GexoMZLT3e7PYZLYL5swlCzLaCgc7mDgK+B443xMxJmi7T
         Roj0eHnxu6LTX3tEftNZwlplsGjd0qWy1pzq0JHAmdWNCLbkEvmTUr5Za8nGCFkg1JFZ
         Xhw2XQ+Hm2TAmVfhTeueKEXhXPpL4zmNCx23dWtVbnK1Jqyumh/j5MM7uDc5P1eHnyhn
         GkdzdQrvruZFt6Zdjp701b08nzJxhZ6Cebt99ustvpLpt+uhAiB53xZkI8hPPeXfJe8A
         B3uFyA8aOEk0ppV0Su1Dy+perhFGws7PPWnAfRIypuidYpqVu6PTl0zNe1BwySMr/JuA
         v0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=3DnIaQFDcmRKFHFh1uGC6nDoJ2L5mkm/XxrMZ+rVQ/Q=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=XURxScTRsPmr8CqoFNuvYKHbbJFz7+8HHvZmvZcFZT3khUGfFNLezA3JNypV4Y30MT
         /MdKLiY6an9KeNW7UT5/Gu+0nuL49H+lvvIt+/QlUt2HMfD3sK3EKyB5Xd+fMHYxGqU9
         HekvhjKKSTm+T02jFWWAhk1Mj4PzVu6GLmPW/HtlsIgpNC8hm9Eiy/49rDnK2gnIPzzP
         c8Re6hvw+dGrAdDlU2CynspfaMC8ddne8+m6K5T/ME1XWQGYQuEQHc3wmF7BCHtlveNt
         WOu74RHHeMEGGqIGBacD0Tey/lGDm7Ae9RizC55ORNbg8r6kNXN2m2F1WUzhHSfZBG4e
         WIOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id 6-20020ac85946000000b00417eb3b1759si2215661qtz.719.2023.11.17.13.16.38
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:38 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-661-sg8iJ5CTM_qvUCPZCLXEmA-1; Fri,
 17 Nov 2023 16:16:36 -0500
X-MC-Unique: sg8iJ5CTM_qvUCPZCLXEmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CC9928040B8
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 791682166B29; Fri, 17 Nov 2023 21:16:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDBED2166B2C;
	Fri, 17 Nov 2023 21:16:33 +0000 (UTC)
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
Subject: [PATCH v2 14/51] netfs: Export netfs_put_subrequest() and some tracepoints
Date: Fri, 17 Nov 2023 21:15:06 +0000
Message-ID: <20231117211544.1740466-15-dhowells@redhat.com>
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

Export netfs_put_subrequest() and the netfs_rreq and netfs_sreq
tracepoints.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/main.c    | 3 +++
 fs/netfs/objects.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 21f814eee6af..0f0c6e70aa44 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -17,6 +17,9 @@ MODULE_DESCRIPTION("Network fs support");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
 
+EXPORT_TRACEPOINT_SYMBOL(netfs_rreq);
+EXPORT_TRACEPOINT_SYMBOL(netfs_sreq);
+
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 9f3f33c93317..a7947e82374a 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -178,3 +178,4 @@ void netfs_put_subrequest(struct netfs_io_subrequest *subreq, bool was_async,
 	if (dead)
 		netfs_free_subrequest(subreq, was_async);
 }
+EXPORT_SYMBOL(netfs_put_subrequest);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

