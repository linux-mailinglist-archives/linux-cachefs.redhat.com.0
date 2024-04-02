Return-Path: <linux-cachefs+bncBDLIXLMFVAERBMMFV6YAMGQEEHA4U5Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A122894D8C
	for <lists+linux-cachefs@lfdr.de>; Tue,  2 Apr 2024 10:32:52 +0200 (CEST)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-4d42de010bdsf1085482e0c.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 02 Apr 2024 01:32:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712046771; cv=pass;
        d=google.com; s=arc-20160816;
        b=WuMHvMw0cvPxnaA36sGKWqQ5L6vEtBi9FaDsojpfCWE+VWA++AOaM8aQC5UNZnU8Bw
         SG0z+KuyPL099PTXlqYwd0VH9jfuccDUDa9OaLOOLjQAIpSjpMo+xTScX9aArCe19sLm
         XjdRAlri6K92dDcrBBPBp81sX4K4mLUdKdYcugZ6dCkBrGpxxqBxZG1QZZRIcnxGPlbb
         6vXebXhIpYMt6epOy55L3+BBjTM7Rm9ScpvOXPn4jyXBgZ4ZQW0IUzqfZAcaFjstJaSq
         TSm0FcJ3u4FV06onk7frSE40TlPTt++c9oLn8XPO1AqCz4Eu5m2Z7EGmdYycJANkqhFw
         ubHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=WN2b1ogWtDQi5fHasIzTaO8QpqIuNWnp1Q1aFzqkwBE=;
        fh=PckRHXBBLNKszRIVlIwbDs06fJ2Qyjqkifsr2J2xNVM=;
        b=URw0Acs4sfd/b5QtYCFSpXF06BmapSV6oJqEg83caL6igUmaN5To/bT2CeqPb6zjeP
         Hfmh6kr7mpT4UPb21rY4lXjiO5jEwuoMuLejIlf7atKbhMoOo1EA+mLRRm1r5wdHh8tV
         SbGtyAAVuIScY9OrXEdnjTTZ6L2astLokW+F9+HlWVTYA02ULaDarh7Rmu4F8dEJFyYI
         lVJ9DMh3rjJQGILU9+rH3RrQgLOFWF8dkDas8RqsuBMGS60d5VA5w4EtwKTHzXsn4Cnf
         dmmxYhNUl2308Pl32fE79baL2quql/qzkDqRmFYdfnQLeBdJQdWceLikPU+yRyAZiiLE
         QqCw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712046771; x=1712651571;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WN2b1ogWtDQi5fHasIzTaO8QpqIuNWnp1Q1aFzqkwBE=;
        b=mSq1e9K8k6DNah+I0ev1GDw2Y+cRVHQZJZEvZbMCLn3WQF9QwjiB6UTT4sAAfA5YNh
         lLOXD03vTojCTUTiYxaN2TtYAUFLCTeq9h+xCGwQlsQCEvS2w5V5ng4CW4/sZoshrV6X
         HYSKMyCtW2xfsU7Q5trMkkJ635Nropn/8vB85XolHZqEVuQF7TjRrmYMFgc6r5ld5xTS
         tYX3qbLeSRSF3DoFCM1WwpciStrn+7mSoNGOmCWDVgJpD4kTfY7JcJl8SOEn5nWBh5Uy
         XOBjaG7RGMQ9/5n6kLhkQ6Gv+KLRi5hjR4iYr0ySLm3h2rQJ2qoqE/Q3xqTNlszZuwQK
         imhA==
X-Forwarded-Encrypted: i=2; AJvYcCVaMD44E4vw6VlrjLTX5POwYZamY38ZMg5dZtyaPoDgqXV9oOzcnogDn9z9g6vMJCC2SpkjlCPb5Z6FzVpW5uCETT/4X38O7UCMWaI=
X-Gm-Message-State: AOJu0YzoBPxGm1rX1CFek5LW6sjf1PtqMS/UVNI49PMxhobCyO/0YIbE
	BZUD+u0EpgpAqTflSgt/EMgG038g4m7ZDYL4RpRUxC9s/vmgjnONS9X5i5rf5wE=
X-Google-Smtp-Source: AGHT+IEt/Xx4l2Vbq5mqa25k95YjnnGUMK/cZQYz60P5z6x2rTqhSOy4fCcR9E+HH0aIacFvfEJdZw==
X-Received: by 2002:a05:6122:a0b:b0:4d4:3716:5d99 with SMTP id 11-20020a0561220a0b00b004d437165d99mr8649482vkn.5.1712046769396;
        Tue, 02 Apr 2024 01:32:49 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2402:b0:690:af1c:7f0f with SMTP id
 fv2-20020a056214240200b00690af1c7f0fls6643467qvb.1.-pod-prod-08-us; Tue, 02
 Apr 2024 01:32:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWU2GLakF6nS0IFGn6pcRpz/Hqp1G5J0LVv64hUWwsyiHlfxA24+uR5ZMM1u7i8MwRyAvX/1tpDMXDVB5lLEZXrmxSyKjMPHIvFhKAziQY=
X-Received: by 2002:a0c:f5cf:0:b0:691:67b3:d306 with SMTP id q15-20020a0cf5cf000000b0069167b3d306mr9998935qvm.17.1712046768536;
        Tue, 02 Apr 2024 01:32:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712046768; cv=none;
        d=google.com; s=arc-20160816;
        b=VcEp0niGYEeHI4MzIiZkkocNnFldK5yHdlcdeIWOEksolwL2zxiB4pkwvWMpYSUv+P
         WVs3+NRM/Vvty8cJUb7XeU5QR+N+gx/EK0BmHGDyX1OJzNRT5/xyyORIbzuM913UkCwW
         1Nu07xPHt4KdhXkyvNd7h6ONr6+5rVBxUR/qzdwHljbA5uDK4A07hJ1Iw5cm8zjptL3L
         s8n73O8azG/e5lZjTdd1Nl/eNCuSc8BxtJVC99eTUTiVL2YjGS11hH/LYSf9dq36oHjl
         VGai9q8PrvoN394i6VP17vIeZyOg3AtxU6KM9ih+sT5TkimhKYzxj7ymyWBJ7QDHkv4W
         0N8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=Y+sMESiDiEk7NQ7Fx8r6KwgieS1M3kfYVE+bjq9Liog=;
        fh=iSaLwgaHOKvfADkzLOGFrUURay6x1sWG9M5uP1y/TYA=;
        b=N0+XJQYE7Ya5nFLWhnx4nnTWGa4jcXfLK2fboNAljmbSjqhBSW2onWADqVIw/yMYVO
         USCJHOi7VJfls86c9Qtu7Vb0zfJDRtlwGVhpjRf7H/BAr4jenpYUwlqHEREvSz1k5toT
         7TcR0Uh44ubxWGr/A0KsmoZkG7J3CVlfZfZuEI/NGTOW6/zur/xMxGwEWIx9RXD5PfZd
         /LOFuvkUOTHn5T1UlVTKVDG9H2v8aBosE4tqv+v+jS4+VX3GS+PlVtwHG/A/OV60XLjU
         qA2IIflb9aeg+DqnuRY41IV0rwKDqFaQ2RmpiMC10Q260rITtoYS4bxOCsUdr7h1yvix
         0jQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id h14-20020a0ceece000000b0069919271c3fsi852837qvs.65.2024.04.02.01.32.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 01:32:48 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-v04SkR0_M6ecyjzgorGsPA-1; Tue,
 02 Apr 2024 04:32:47 -0400
X-MC-Unique: v04SkR0_M6ecyjzgorGsPA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C57C238143A0
	for <linux-cachefs@gapps.redhat.com>; Tue,  2 Apr 2024 08:32:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C242DC15773; Tue,  2 Apr 2024 08:32:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66B2CC1576F;
	Tue,  2 Apr 2024 08:32:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240401135351.GD26556@kernel.org>
References: <20240401135351.GD26556@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-27-dhowells@redhat.com>
To: Simon Horman <horms@kernel.org>
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
Subject: Re: [PATCH 26/26] netfs, afs: Use writeback retry to deal with alternate keys
MIME-Version: 1.0
Date: Tue, 02 Apr 2024 09:32:37 +0100
Message-ID: <3002686.1712046757@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3002685.1712046757.1@warthog.procyon.org.uk>
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

Simon Horman <horms@kernel.org> wrote:

> > +	op->store.size		= len,
> 
> nit: this is probably more intuitively written using len;

I'm not sure it makes a difference, but switching 'size' to 'len' in kafs is a
separate thing that doesn't need to be part of this patchset.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

