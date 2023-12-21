Return-Path: <linux-cachefs+bncBDLIXLMFVAERBC72SCWAMGQEPV4DATA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E5E81B789
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:26:36 +0100 (CET)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-67aa0c94343sf31300856d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:26:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165196; cv=pass;
        d=google.com; s=arc-20160816;
        b=LI2QK2BW2GjFHatJW9Xa8Jt8SG1lS34hT/TifqXFDPYPkxAlm/4MJzt/zEgIte50nW
         S8tc+xQkZDV6EzEw6wmamfb69DPMgm5gCg2hqaov1g/AzC484uyHbT3sS314avL20zCh
         ZpgQJo+Pg7RoGcxUXMwVWVZRRCF4L9oaJlVe3chouCpEdEwg7Mpeac1OM2zs0sl9rm1T
         5U+GTGktzCt1wPORH6AHzZDLgDrbrydSyNYZ3u+6vsxrujl+mbCe3x/PQEZy8AkSfDp5
         3K3hxFHtv8gQMxLVrdWffFdVahnoAc0n+7v40KiZBmxhDyXVVAnpj1o92vSL78cDu6if
         v6vQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7PDLY3Q+nAtZCldsrn4ifz5yTMyOSZo6coLvmXs7qyI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=WZsFY6pcCDTIUreI7gc5jvCvmFGnDcUPGXmz57UrGHS/moO0GqYqPlxQnGTc+5F6wj
         vNVeRPOXR46QD10GVWiuF3+WmC9HU9aapohASvEm6VXC/IVSOrJdiYIFiGZ3aWC0GDDx
         wvSGDVFFZYEPzJMdf1VtRfJaslNPNNDZQFiWxdfUxZyTeBYwBmKRrVscAc/7x+ddhFFh
         YEJ78BTOrN3TypRmQCHnhfeh2/w3A3QegWiohqlxzw56eJOPa2idhpjYc5uN+roBjcUr
         6yp3XgEPKvH1CDH4DDJ9rMiqHYhdn9rM6yFpgS+wyMhs0GR5HvFDEMze8kalToUscek9
         L6pA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165196; x=1703769996;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7PDLY3Q+nAtZCldsrn4ifz5yTMyOSZo6coLvmXs7qyI=;
        b=lvClChtPvG7dLDSj0N+TqjncDFOvO6R0pXTOtI13nj/2WFu1VLn7hCViu8taFHVwRG
         yFVwb3x+44GS6Wkz0gSfnT26d+f8/NIgvRCrjfZOBWm1tDus4aFLfhzomQiVssVGjvcS
         opTETNsUEBjFzzk+WqFCD6yuS3jxWobF/0F8R4r5IdeSKcgjwWI7YQtonO/rh2CNeLGH
         hzaHgc1OdkvWJgRf169QKLTFDtr2psgJRfRsWa3l0INK+nQa55memnpEWWUHdiRX3Vcj
         NMWqEF7HKU8RcZLx8sjF+jLBNecJbG9wuTkTLZdUHz5dFigI73FmOQUEFhyHDvnHxP++
         bAuw==
X-Gm-Message-State: AOJu0YyxnzyXZrUWbiAUlejNJU2A/u789tQcfwsBKshZBor0vRF/7COt
	QifPUkU3yHa6uTuofjqcwyUB6w==
X-Google-Smtp-Source: AGHT+IH7EXHTGAApZjk8Yh24xwWhvW/uIpRvUaThOL68ZS2gs8yO0KmbOEu9psa2oAkXAV7VaFX3IA==
X-Received: by 2002:a05:6214:5197:b0:67f:24c7:a54 with SMTP id kl23-20020a056214519700b0067f24c70a54mr700490qvb.51.1703165195759;
        Thu, 21 Dec 2023 05:26:35 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5bc7:0:b0:423:7e09:49c8 with SMTP id b7-20020ac85bc7000000b004237e0949c8ls1747059qtb.1.-pod-prod-00-us;
 Thu, 21 Dec 2023 05:26:35 -0800 (PST)
X-Received: by 2002:ac8:5d0e:0:b0:425:9aab:fba4 with SMTP id f14-20020ac85d0e000000b004259aabfba4mr1047333qtx.39.1703165195037;
        Thu, 21 Dec 2023 05:26:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165195; cv=none;
        d=google.com; s=arc-20160816;
        b=wx5f976KPOr2m9aQ9q4pzu/BL9PpCiboy9syxdZcHNFhelOocX6hXfLzXfA8kS7JqZ
         87OPPorclt1g3D7GDhaIxxigQ16fDAkBMVowhqrgvDjGKiAHAyRFlWCEiTOEpHwxm7tl
         u9kYq9cYZ8CDHHwJoWNFCRZ+Yd+TT+0DE9b18xj+UMvQkC3DyQkzqLXu+tZVFNFAwUf3
         b0EOzjRAwGwv4qErStaeO4gORjgug5g6FGsZsqd+DxAElL5ZPPpDksNep22DNxRte3zj
         03dEGD8JBmmmbr4ue68+A9SHUNZ6F+4hTP4fovRTOlWpArUQe6M0v/TxsZZdXWiOEX9H
         nurA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Cgmint4U4io/DVGAE4w1KSEF3oUqI6P46d5eIrAz1MA=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=PH1xySQ109wLKDKkB6MJ6o9f7V8fpLyijrEI+IVlBRPTsOcdCty4Jtx6FZRaNId3RQ
         aRSF6M51UWmmV4STu4QSdxCmg8sJD0seP5I4LJcj8+qZwpb0jUKgGK63XhkN+J+V8MjL
         r2JMuaHoC3UzUB0LfQu+o1LBY4caDSvevQtjjZ94knnSerkAXLCvh3ktUmgOmF4OSHcB
         d0N3Fh+nAap3k+Tt86k9LJuO84sAALoGj939feXIozzkaqt5TtsDakOQqoeGLc9Ckc7h
         KQEfpyArVxz7/SRCbNWbJMzJrqDrdjT7o7sm6iN8CR19kvNqbl6IwP3Fg3IXb7KjyfHs
         L5qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w8-20020a05622a190800b0041b83912a5dsi2113330qtc.187.2023.12.21.05.26.34
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:35 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-xlkytXqJONyaC5g8DylHPw-1; Thu,
 21 Dec 2023 08:26:33 -0500
X-MC-Unique: xlkytXqJONyaC5g8DylHPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5689F3C0BE37
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:26:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 50074492BE6; Thu, 21 Dec 2023 13:26:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A75A492BFA;
	Thu, 21 Dec 2023 13:26:30 +0000 (UTC)
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
Subject: [PATCH v5 38/40] netfs: Export the netfs_sreq tracepoint
Date: Thu, 21 Dec 2023 13:23:33 +0000
Message-ID: <20231221132400.1601991-39-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Export the netfs_sreq tracepoint so that it can be called directly from
client filesystems/cache backend modules.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 81a13071b258..5e77618a7940 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -17,6 +17,8 @@ MODULE_DESCRIPTION("Network fs support");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
 
+EXPORT_TRACEPOINT_SYMBOL(netfs_sreq);
+
 unsigned netfs_debug;
 module_param_named(debug, netfs_debug, uint, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(netfs_debug, "Netfs support debugging mask");

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

