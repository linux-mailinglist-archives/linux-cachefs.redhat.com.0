Return-Path: <linux-cachefs+bncBDLIXLMFVAERBVMRS2WAMGQENH5ZZVI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9D881CA6D
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Dec 2023 14:02:14 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67ac7372fd8sf24205276d6.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 22 Dec 2023 05:02:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703250134; cv=pass;
        d=google.com; s=arc-20160816;
        b=vV2uP6C/M91SKqMk5sUA3AOYJt6cBtzO3hySdMUqX1S5yw1S+3qxShkAXrc/xWbKqW
         RDU3tYe2onxe+mcggQJvL7T7Wj1bzzMngJ7Lchg4CYwd/wEv2zaRJw5VbrYCUfgRoSv+
         CfDcllN939UloI0qGs/wZ/OScPK+ZnzogPDKWFWTTqqxBcB2wlK3jLdm2zu4Ia6jWdVm
         /xlUE6fSEtR0yOjQK2GJPdmI0cQjE1KCrt8YfRQOpGyddCKW3pSIHQdhxmC5LnvPESPb
         WNgUtGHTm15dT+xu0F83J0P/ux9qiJdGnCqnjTv70PVhNmS7ct1L1IAXuuBwtljjfEHO
         qv6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=Foi2iOGjaLj2IsJdXCcFly1e7CCc0KzR8AuZFEeYT90=;
        fh=Mwp5jdHBE8+WZ+QhDx0Zvk2DkJu8z45fEMGGbscGfGA=;
        b=rfCYj4Bz7SWcadaGVYG/3NYwh2duDyn9WQ+2aajUuTmNbrm9rW8VFKn/iNn0e5Wu5s
         C5glOJtJ+f2RICY7kHByVkD4udKuc+B+cu16FzkWeXLJ0t/Cig/0bryVwe1/TysFt4es
         yYF1zkMjNu4TlN35oqD4ObSTLnLfIPJESMBXFw2yrbVeqW3tv98puP3onZpdn98VmEA6
         ccYDkatp224y99C55BHEgTrobvxqSRQVphZa9KWY1DxS65i7ZND6HNUjGxCQLJ6BIefy
         djOF0igRkd6cBF9NU5yIQwrcRiDhr3cnSYIuUk+Y0VEQAX5J0Wfe4AqK06ONK4vho8An
         qveQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703250134; x=1703854934;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Foi2iOGjaLj2IsJdXCcFly1e7CCc0KzR8AuZFEeYT90=;
        b=I1Lyji1mSMjhvcTBp69YAJoTbgbPd2MOCHs68w5/aEyB5TX10mNCPxXbBHA2ZchqWT
         9gsi4ZuImUO3rQNaOA0Foctbonc4VUUWANtdwM9nvCAVAV4PqVAdLgBhjXq4eYLIrc+W
         p9++fPhjt3e1eWQluQOTFUpnWYPq3CwKGAX7Cfo+B4tTqrn1VfZiPUvs+hBZqsBA6khg
         r0Gg75HKordwRQbbsQ+3afWcAa1Io9EylH8kSYHtDCIHh3AxjsgV/t41QJkuzIg1b+A3
         GFuIGxG2yXpwGFgce1TCrbp+/E6oG9s9xeB17K8HA3YlQ/LvHgHyK5Aq9lZkW9bjoevZ
         hjFA==
X-Gm-Message-State: AOJu0YwG2Otz+A7e5+cxwarUjLMgMp/c1ob2da1APN9TP0icammot4TY
	qcEtLfuGq+j2ciRd1MiiJlh4fBN4gIBQUA==
X-Google-Smtp-Source: AGHT+IEClk4Yip6g8w9rx6TQi7x+5TjgRA+SBC26tL4b9IzWsRJSnJV1ijOPtRHS5sQ6dYE4em3tNQ==
X-Received: by 2002:a05:6214:c8e:b0:67f:69b7:d8af with SMTP id r14-20020a0562140c8e00b0067f69b7d8afmr1553730qvr.61.1703250133832;
        Fri, 22 Dec 2023 05:02:13 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2305:b0:67f:1338:fd8f with SMTP id
 gc5-20020a056214230500b0067f1338fd8fls420176qvb.2.-pod-prod-01-us; Fri, 22
 Dec 2023 05:02:13 -0800 (PST)
X-Received: by 2002:a05:6102:fa1:b0:466:9bff:2ef8 with SMTP id e33-20020a0561020fa100b004669bff2ef8mr685224vsv.62.1703250133258;
        Fri, 22 Dec 2023 05:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703250133; cv=none;
        d=google.com; s=arc-20160816;
        b=ExabHIMk+NGlzWJDJfjkFdH/H7wqXVb8HTbB8e02DznS2HOpbqmnARV0TszyWI5L1O
         3I8wRaaM/LomoxhZNRyonbd/J6Jou02Zlwx4ODOrUkqUFqswp7Nh0jzR/NpFF9DCiQyk
         bQLccUZZRJGUDXABTmqGkPxYrPo5r4j4IXNo66/9Dh6lx0/EGr/aHOhx3u35t26E4kNP
         End/rv3P3o2Ks8xjpGDzLK1cOzV78mTi84aiKd3oKOqcsw8wnD8x3hBJka6wyBr80WZu
         /sxZwdjehptHWmExDcAqervBfBhTm2Yv9vl/AfhcGE6G11SpoWOO+6rUB+JYqodwuRlT
         vwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=103ot+8G5+FDIc3LdlvRAMvDW9sfIrwHmOaY7zsDLfQ=;
        fh=Mwp5jdHBE8+WZ+QhDx0Zvk2DkJu8z45fEMGGbscGfGA=;
        b=sn2905eCHQeFrg0PqevKBalr37VuhcCXKD8Bl3ZRovBlFgt2oRfuCZZ6TnKpoxhfJq
         wSPgEKHFpgFkTIv5FZDxYyFd2PQ48ddVmh+nkCbm+s9IAt3ICwgsQse2PkFmw1yVxCwB
         G9pIGAIeRa//ivUn92wKhMdODV86ILi3O6qF40AxCGVgaYj5wDNsi7yhwKCvbuF+qYfi
         P7gGpMw9q2/yv6K3rMFfRQE8C2KWMM/oSAmkq4lJIsF2NiRJ/Qh3E+YRPMVPp+9hmc/f
         9ixjX/KTF8kIZqiQ0FD/FaXCCmcbzoM3D3jwOeKSV8DpkbyLlVW/6cYgM2ryV36w0ixr
         qJhg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id u5-20020a67f505000000b004668e9dc2cfsi680096vsn.623.2023.12.22.05.02.13
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-ASdidBEmMHe3xwQZAenTmQ-1; Fri, 22 Dec 2023 08:02:11 -0500
X-MC-Unique: ASdidBEmMHe3xwQZAenTmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C706185A780
	for <linux-cachefs@gapps.redhat.com>; Fri, 22 Dec 2023 13:02:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 555B35190; Fri, 22 Dec 2023 13:02:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82A9251E3;
	Fri, 22 Dec 2023 13:02:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-5-dhowells@redhat.com>
References: <20231221132400.1601991-5-dhowells@redhat.com> <20231221132400.1601991-1-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Gao Xiang <xiang@kernel.org>,
    Chao Yu <chao@kernel.org>, Yue Hu <huyue2@coolpad.com>,
    Jeffle Xu <jefflexu@linux.alibaba.com>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-erofs@lists.ozlabs.org
Subject: [PATCH] Fix EROFS Kconfig
MIME-Version: 1.0
Date: Fri, 22 Dec 2023 13:02:06 +0000
Message-ID: <2265065.1703250126@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2265064.1703250126.1@warthog.procyon.org.uk>
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

This needs an additional change (see attached).

diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
index 1d318f85232d..1949763e66aa 100644
--- a/fs/erofs/Kconfig
+++ b/fs/erofs/Kconfig
@@ -114,7 +114,8 @@ config EROFS_FS_ZIP_DEFLATE
 
 config EROFS_FS_ONDEMAND
 	bool "EROFS fscache-based on-demand read support"
-	depends on CACHEFILES_ONDEMAND && (EROFS_FS=m && FSCACHE || EROFS_FS=y && FSCACHE=y)
+	depends on CACHEFILES_ONDEMAND && FSCACHE && \
+		(EROFS_FS=m && NETFS_SUPPORT || EROFS_FS=y && NETFS_SUPPORT=y)
 	default n
 	help
 	  This permits EROFS to use fscache-backed data blobs with on-demand

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

