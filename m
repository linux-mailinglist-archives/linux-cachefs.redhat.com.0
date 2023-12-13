Return-Path: <linux-cachefs+bncBDLIXLMFVAERBWUZ46VQMGQEHIZI3WI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAE0811650
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:15 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-425b4c1b67csf67623601cf.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481114; cv=pass;
        d=google.com; s=arc-20160816;
        b=CVczQILhSzxEzLaxoYgO8P+v5K9ftbkdn7Ted7mK4eZ7hBs6TJVamkqMQ/YrGFkqmX
         Tcy6rsaRhOdfnexwFZpvbjhaO8r2tj8ejKGiJttcctUwJUXix5ZoR8Ym12djh30MC3vt
         ttYkllgfCv4xulngIIbqxy4NlzXtdc8mFTj0LpzYa98/CYS7aSYFZ2gcocAolFhX6Zpe
         gdNbboqQiO+orzhQyX/6p9Dv9W3nH45leXWUw991IdmuKJumsyWR43xIY+B5eKXbC4jO
         HeKKoF44UbuE4Jb16qsqwMiEnOClriQRIu5tgxYyNxx8aZmgGJcD9hNIIK/sGF8dbykL
         3P2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=I3gzM2C1b/pRxzd2eMJBEB15zYmY1UqKubA/OvEqANg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=ZHG7BxaHUtMMlpMOX7n6f7m0xYAm5PzpUPfORtNalW3XK6srjSAXVdu+dTcxsDLGlM
         VCX6NdAQvp5mmEk95BnhIIFFKLEgQr5XNTDnyS8g9mSBxU/KvOhrWgTP4ENNNjMW/zX7
         emXmTRtSJcLQI3HC+MhWeBDzlpaGr1NpA3A1RHZPE2yWN15RhxjMHHhxyDJjg7krfLWX
         oM8vunGnnEaDPnCO98mG1YYMXH5xhaxfENtZr1ABdWQDxtgjgXaOMGZsvVzladsCx8Lp
         QSnIOsZGNONYbtCxaw5diuixUV4bspGMVY5v5m6/c5Uyuin8pvURCwcKdtcklmyQcCLw
         cUFQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481114; x=1703085914;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3gzM2C1b/pRxzd2eMJBEB15zYmY1UqKubA/OvEqANg=;
        b=MaPttEa/l/uKCQR1PBG+qlAK8SbEzRLPFE+hCQuJil6bOufuIkhBmQ1j17cjYNXIos
         6O9dYB5wOmGey2DtXSCMJGtA+rd+8QCsPo2B0V8XSvCfkxMqyxpp4dsaMTLrR8wMrdYG
         q+IvIh+sU7RhWPnWwr9Z87boqOfaqEI5wyUOlWziHLpGtoRiKImcBOzoaGOElDb5CbA+
         neFfuLAYCOzV5QJFPAVF7/XOWaTC5hywXtpc0fcOJ9x5MSDJDDBw0yDFTFctfUyRvoDg
         JH0tLIOabRLa5hqtmUBeMcEIozAtEn35o5PypAnvEaYIgYZctNOJbVnywFlqRBEoI8op
         Kd8g==
X-Gm-Message-State: AOJu0YzfkhRy0sSdCidEaFBgQrfgsIdX+Wyw71V0RoPHBZWRAyRfOu+P
	+B7FtOwE62+9SUnBME7c9wNRzw==
X-Google-Smtp-Source: AGHT+IGvusyvcKE01GtuDtzeqsSV1g39LSV8qudJms+4EzqALSe92McBpyuNe0KO4iUQC7Wdls/lgg==
X-Received: by 2002:a05:622a:3d1:b0:425:4043:419f with SMTP id k17-20020a05622a03d100b004254043419fmr12559236qtx.75.1702481114461;
        Wed, 13 Dec 2023 07:25:14 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:423:e09f:e8dd with SMTP id
 s36-20020a05622a1aa400b00423e09fe8ddls7891378qtc.0.-pod-prod-04-us; Wed, 13
 Dec 2023 07:25:14 -0800 (PST)
X-Received: by 2002:a05:620a:1a08:b0:77e:fba3:81bf with SMTP id bk8-20020a05620a1a0800b0077efba381bfmr10623176qkb.85.1702481113973;
        Wed, 13 Dec 2023 07:25:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481113; cv=none;
        d=google.com; s=arc-20160816;
        b=iDGu7QASY258QnfaBpwmcN1NBsk7yv1d+UxkI7M5171sGFhC+AkFRMwYm9UpwkJHoM
         LXG9S/U2YuECn0a4On9t1vGO2Da3YCd/NPonOTKa6/W1gqlKEM9uRgC3aEIJrM6rylb/
         WpO/eEKDaq4hSPuU/AKjv22KaC6kHy7cuwGwbzwVlGZax/rNKp2ujb+8bLswqTVUpK9M
         WKSsWKVBeqLwsYn/m47WohlvK1KkToevrVQXD9pQhrv+QMGihEC+iJvq0Wn2VYqUoT/Y
         0qCvA+PNnFCL1yoVOwDlAHAFgz8DTOBT0gdIEd0n+usDKhEBR1fs8+YJYmuGP2DjcX0P
         huRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lvA6ro7QUMhtjJlsHPwIgzyPLJOZgWtkvO2st3qI+pQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=dJp4pqTqBDDhgjP4uSdYeOqCVkACjKOClvQXKsd4kXroGZtYPCz+DNO2LNxSEjauX1
         KavOeFNw/vArlRh6FST56yJe3EXmnQp096EVYkMq6fLtXBxGwWQOXTS4zqbwEhDgPV1e
         Z2UHvyJFDP64rBzMNzP5YX9dHncjhy5O/XxX1EfyaqqX1HgEv9v/qnvW3Gkty9CFMa0y
         wyH04ZPh4n+PuRz9YP55Oo8JSrgaali2dqE8A32bdNmTLCZOgvmm7JxnCvUHOD9oPtyx
         KdZJKCuq9DS7SOlGw25SANLjdWR+VvoDFdvtPo5yxsjM6WN86A0/KY9QgUMjPAJfPP7s
         8UCw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id ea18-20020a05620a489200b0077f0a4a7d39si4442963qkb.611.2023.12.13.07.25.13
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:13 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-MB_uxTR9P-C3dy0EOSC9SQ-1; Wed, 13 Dec 2023 10:25:12 -0500
X-MC-Unique: MB_uxTR9P-C3dy0EOSC9SQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B878385A58F
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B59222166B32; Wed, 13 Dec 2023 15:25:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDB4C2166B31;
	Wed, 13 Dec 2023 15:25:07 +0000 (UTC)
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
Subject: [PATCH v4 18/39] netfs: Export netfs_put_subrequest() and some tracepoints
Date: Wed, 13 Dec 2023 15:23:28 +0000
Message-ID: <20231213152350.431591-19-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
index 97ce1436615b..404e68e339bf 100644
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

