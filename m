Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQWWWSYAMGQEHCNWR6Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B58896BBC
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Apr 2024 12:11:15 +0200 (CEST)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6968a5b3557sf64170776d6.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Apr 2024 03:11:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712139074; cv=pass;
        d=google.com; s=arc-20160816;
        b=S2Re59GmRPl472Tj7faGj3vCBceH1NF00hCwDhS6IqRbJ4DDu7ryHcbU/DAMFq//cc
         mtiy664YfOZtiuNjVdm1dV8aEMT6m2m5F6UzWLOOsxIaohNSJyMBEUvbeymp8ih0ls2c
         DclTLmf7/Qs8LtauEurkD9njBEX56Nld2o/a4ZQfyMc2IxU/JYfesN3syz3m8teDokHp
         24heasCEzP6IDw0XX7b8QREItiPakZ8HKmGI7eQyVFI248Tlh5/JkT9Z0+HjiUti6/Zw
         /5xVvqd25BoP5/xLJGE3ST5PcarySQnYaDa2EVaLX+escO8jZDRNtAQm1DZ9IfpJVIR+
         9Ozg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=dDNV9Wo3ZTwaB72XBz8HfAkNOUoPh0y/4RgREy22dgA=;
        fh=rTm8N8BHTcekhZz+LbKkdfqVrOFS7FokQ+EO1K5lEDE=;
        b=W+4BhzkcpcIL5eM18X+se2/C9PYM2x8umgF9ybZry1SUF/+xihiLS+BHirlJ37dlvr
         /7UOZywRth+4DbwlQ0M+/FWXv9JmdwnGcfjjLyOgEEWVsSLYQH9nKVrKCOQacHZgpr0w
         q5bS3tWrzSfcKzG5FIph70ViF2CUzjP95yIgoPpvkH5QTmKatURDBZ77DRamJcBfce3r
         blpAQDQyd9MlTPr6VkILqiTZoBoejd2RehyfOyZlo1edxkAyyha5JxPwr0/issmpJS+p
         Bor+ngiENrtx5c6y7Kshl8QLgdv5OEUTf0cJaHaWEGSoXeZpVS3sFt6U4WD7JebCDEY2
         VNfg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139074; x=1712743874;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDNV9Wo3ZTwaB72XBz8HfAkNOUoPh0y/4RgREy22dgA=;
        b=SZxmcYQw8UoMLd7I2F5Z7yUhTt1KeV/87EGXasRzdpKNUev/3u01arhyuKP3Mu1Nxk
         ZMnMY4a6/qtkVKsF/j4Js6trh9S18dpIpefBDEbhTPU6na8VeS8I0esSFsGTXfUOocNN
         KoLB/QG43RThhud5X3oiGtHzzXWHpRv5r0LW0kNTxKZJXExdEcW+E9spj9gvsxMduxJk
         LYTdEmRAB8AgZ2UJ5z1Ro5G3iAhe1t7ta1tKvldYZkV6onNHpSLgVhRN3/xiT0tqf0Fq
         pmRXMClVE2dSH7oL96+RkU5KXBzPXh4rw4GLbo+BE/I22/iTZt74x2Uom2UPA/oR9IAo
         alfA==
X-Forwarded-Encrypted: i=2; AJvYcCXWF+NIJVkHWcxd06dcfg7G/uFHPNhaz9KJaaMs1tIw/CJNOt4UMqPbkqOft3g1kOg7YTiFAjNFGd+1hBozSE2n9P2r5wmDNwldGVU=
X-Gm-Message-State: AOJu0YzuWMunTVR1vtWlenXrD9TnJdKUM1qOag93Wm7GpnH5dDBtkwz3
	zYZ/x3Diy3nJIJ5bSCrbrVGg9DguWCY7heMC16IsoX8NpmyIWQkqgWLEUIQy6W8=
X-Google-Smtp-Source: AGHT+IExJRkeEC+Rg4yhCLxwNaZxEnuxgEjHdIFzuKg3dCN7OVR+d4m3ffkmuiWmhewcVOR6tR1njg==
X-Received: by 2002:a05:6214:1643:b0:698:6bea:1c37 with SMTP id f3-20020a056214164300b006986bea1c37mr11751137qvw.26.1712139074217;
        Wed, 03 Apr 2024 03:11:14 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1947:b0:690:ee1f:cfe3 with SMTP id
 q7-20020a056214194700b00690ee1fcfe3ls3510956qvk.0.-pod-prod-01-us; Wed, 03
 Apr 2024 03:11:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVOMPgaD7LTKJHtWZi21/T47XiJPG+5/AV17wRBHqmtWqbPD2hJniRzsz2KcM/lRByg0YKSdt3pWC57W+C2F9roXFNp4rQjUjQK7LhcsZY=
X-Received: by 2002:a0c:cb01:0:b0:699:2171:ae8a with SMTP id o1-20020a0ccb01000000b006992171ae8amr2846257qvk.28.1712139073589;
        Wed, 03 Apr 2024 03:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712139073; cv=none;
        d=google.com; s=arc-20160816;
        b=q0Qj3+PMC+lUw1CrvORuAHEfy3H27HSolY8SbfOky1KwQYFBckYhPR9qdzT43evt2W
         8ZDJKeWnTW7mqAuTFW4gF3KncCzUMivWDJqktjU006I1iQHZhNNznNd7204XtbkDFyQn
         KdmED3tlQTeaGY/6Vq7wyKkSlimQ7/CyWSQwJo3AoTdL5Rn8yvLP0DTGMp93s39o9BE2
         BIMOu2rNYS3JPb7VUa8N9xgD1ws4FaY1v/gIlE1s4hjrMuXd0Rd54JyizEqWAydHiUE4
         IMxkaoPUFj+w2C1tSSE9/aMwr0F7pGqzF3S7DWV5kIPgzTo/THckYGLeL+8Z9w00xhxz
         /KGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=q10XbPWbwPAYz3tVe+780L2sWGchjiaH8ntssWQEh20=;
        fh=OTg2WMHJtOqcpGTWyrCVDzG+wPN5q7xsQc52pUkpGv8=;
        b=kebKQAa2oRwXMI3NEtzKeTmsv+JbSNoqwcwJgsi+XMUFKGEK3G2ZM8w8ABnl3Juln4
         QZH4ubdMJiRP4eL+LgU/JMPM3Cic2DpF9WoysDke6zsBQTusISvsTlpfQb8zrMteARWV
         FP6lO7NcrnmqF//f6OadF8d3zewqwy/cFhuQTBckKbeWSHx/3qfJQAiTDUj7cKWEf5H9
         tctaHbtDkAwA/No/FN+UCD6FO6FZigypytFRjYpKZDJ8npaJD7kQVlhgjFEawZYTmiME
         e5ngnSTSkSN2jZwUo2ODYcfb5BXtmn2/pu4IA/65dJdi9vVWZ6+xEAcdmIFw1+71TL/Q
         5T+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id a28-20020a05620a16dc00b0078a0d51b9e6si14147367qkn.695.2024.04.03.03.11.13
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 03:11:13 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-4MUQAaQ3OIyvzWYxmd3n_Q-1; Wed, 03 Apr 2024 06:11:12 -0400
X-MC-Unique: 4MUQAaQ3OIyvzWYxmd3n_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E346F803F60
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Apr 2024 10:11:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DFD0040C6CC0; Wed,  3 Apr 2024 10:11:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51AC140C6CB3;
	Wed,  3 Apr 2024 10:11:08 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240403085918.GA1178@lst.de>
References: <20240403085918.GA1178@lst.de> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-16-dhowells@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/26] mm: Export writeback_iter()
MIME-Version: 1.0
Date: Wed, 03 Apr 2024 11:10:47 +0100
Message-ID: <3235934.1712139047@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3235933.1712139047.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

Christoph Hellwig <hch@lst.de> wrote:

> On Thu, Mar 28, 2024 at 04:34:07PM +0000, David Howells wrote:
> > Export writeback_iter() so that it can be used by netfslib as a module.
> 
> EXPORT_SYMBOL_GPL, please.

That depends.  You put a comment on write_cache_pages() saying that people
should use writeback_iter() instead.  w_c_p() is not marked GPL.  Is it your
intention to get rid of it?

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

