Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRHPZCVQMGQEC4CZZPQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 582FC80935D
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:18 +0100 (CET)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7caa1e130b1sf173746241.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984197; cv=pass;
        d=google.com; s=arc-20160816;
        b=HCYQB+gjFJrqOQcvS6Vw44C9ucij+ITzG78McDEOKreDcmgbCoCceiImxOtYJG5bPJ
         +J5KnkzvrIS2wcvG5jfz9tt5TCAmL06/NRmQix10FcAp/XdIFkpKvjw/zmPZU2z+TN85
         jbv2TbWnPMxJlzeVHuPEptrv1Ju131g/Pm3a+E2xYjmlT3NU4zP4P6YapVyWv7gDcfuW
         MI4W610hfq2/O0KW860Nck0Qi3s277Z51wB5GroWwDYnyIbTml8qJUZlUwkx2mxVRYVm
         kjzstASUDIh+BhZ6fy+Wh7KdyTsH9wgtBD0fnXd9sU3mZ2b+SDKL53LbrXZR6AVAjutm
         SrfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=I3gzM2C1b/pRxzd2eMJBEB15zYmY1UqKubA/OvEqANg=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=NjGEsd7eHFjdPChImVksAH49KgrqsWLrcB4sytOYmDj4x45qdqjffyQynUMLdT7vfu
         A2WikkNP7hR96lTDlGsO2c42IA1I7GiOItmm8qKGPM9h0zWc7eVadMRRWTLTaFQ6lSJU
         XjvHcDRzrJTmvxwQmL0aKTMYBMNiPNmp+6m4yJeW/w6jpUS3YU7/PpSrw3kdKygK0mNH
         r6voXRCHQvPVqlOoip2gwDrAiqSILE76Xut7gro5lgC0JMDF2/HQch2Uj7iDxIplGyVB
         lDL0Yf1n2Nfug8vai+gf+LQEs/lYMLO/outuSPc53PcFQyDUg9AX3Me6gKqtyCeT+snN
         YxIQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984197; x=1702588997;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3gzM2C1b/pRxzd2eMJBEB15zYmY1UqKubA/OvEqANg=;
        b=esEjXp+X7WpxjpyW8aXhUuVe0irQVjbZnhxHMG1Eu1zslMnTR5fbh9AS9VxraKXTiU
         RmWe1Vz+kGZb/2uI9Pv5HL5nt7EAX1Wca4wH69yvI165ameFtowocG5SydHt1giz70SE
         wXN1F6DTydjpmiL0giWNsIfAXRwEMBHhepvUa0ZEmrg65GgR4lI+YjVlWNuch8g4lDrh
         0kWu3cej//Qz0tshPUI1LPOaZ8AwcHg++pOmmYkogjcXhF5arP0ugfnL8eRDe4oWVsYx
         2hVFyz8sU7lbwupknhziNcEMLtPBB/s25t96LASiyHb72iQEbi7x4fSXxdSKY5NJBaXM
         cDIw==
X-Gm-Message-State: AOJu0YyuA7MdvEX5uocKA++EzZw0PjLlwaIJ05EVISIK15QGgEi456Xg
	STbK1mAmBZ7yQy7Q1lnUjcWyqA==
X-Google-Smtp-Source: AGHT+IGlvuTEIXcqrPlF/2C7Vz11yDJSUasObHmBFq/itwtk+A3NXGm7BSgxzir/3cei0vlZU8E8fg==
X-Received: by 2002:a05:6122:3bd4:b0:4b2:f60d:fc5 with SMTP id ft20-20020a0561223bd400b004b2f60d0fc5mr2980074vkb.28.1701984196881;
        Thu, 07 Dec 2023 13:23:16 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1994:b0:423:b70e:f8f2 with SMTP id
 u20-20020a05622a199400b00423b70ef8f2ls1454211qtc.0.-pod-prod-08-us; Thu, 07
 Dec 2023 13:23:16 -0800 (PST)
X-Received: by 2002:a05:6122:4e20:b0:4b2:da08:10f6 with SMTP id ge32-20020a0561224e2000b004b2da0810f6mr2573338vkb.31.1701984196337;
        Thu, 07 Dec 2023 13:23:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984196; cv=none;
        d=google.com; s=arc-20160816;
        b=Srjvalxod4iZ+e9Yy4dmuj2U+DKuwyO0/HFRFrU0nILc6yKkBoLtuXqVqUgbDAZMFN
         IMqZ4sugA7K1R1emqXUrhXWV9OZ09f39F4Fm9f/X0Ci6vaKiMhXYlFXydiS/Cdm8hxFd
         cSN++8tmGeeGXOeg0lK7K9+n1U008rvAKptMOyPpokCH/Kwrx8efL8i761DiPXSA07E+
         2kluvaS/RZVBvq6e/9jv9aCqC9vPOkTSuBmIzlWYWMR868jBaxnuMUm2OAjo644Cfvws
         7kOsNLOMxVgFWXlTIHR/AdY814H+FGukeRmjifzhKAuaS3cH+0DYfw7yG5+TszyUNToQ
         dKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=lvA6ro7QUMhtjJlsHPwIgzyPLJOZgWtkvO2st3qI+pQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=kz+WTyeQipwlyrdUJhrQE0M5x5PcH7wUtXQ/GDlvYbFp4V3FFGc3I1e9aybMqPETjY
         s/94v6/7lIKECandlI1wRcrbRirr46KVIfWCLo4TyNQFvGtw6L6Lps+uVXeGRAwoEQhd
         n+JehjFLvwWA5cMAueEjP5gc2wj6IScFZ9KpC33xL5WM7Z47UsRrYzSy8kGHWxhSmdVH
         tQOHB5aWIYswMQe1OuKuim+ymYLFcSBQkbDwp5+0qyfM1tXD7LSAyvYKbVh3fu7v56x6
         o6+XK57JcLMS7M52vnHi0wQLdAyALY2aKWa1NwH546faon1WdrB4Ntl70GupqZ7rkSM5
         NlEA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id j9-20020a0cf9c9000000b0067aa5ce6c28si596537qvo.217.2023.12.07.13.23.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-RmDF4pYyNw2hsAzkp5smog-1; Thu, 07 Dec 2023 16:23:14 -0500
X-MC-Unique: RmDF4pYyNw2hsAzkp5smog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E3C3185A786
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4A7121C060BC; Thu,  7 Dec 2023 21:23:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C2221C060AF;
	Thu,  7 Dec 2023 21:23:11 +0000 (UTC)
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
Subject: [PATCH v3 18/59] netfs: Export netfs_put_subrequest() and some tracepoints
Date: Thu,  7 Dec 2023 21:21:25 +0000
Message-ID: <20231207212206.1379128-19-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

