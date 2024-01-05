Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQVG4CWAMGQEITE2QHI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305F82555C
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Jan 2024 15:33:39 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67f943c0e6bsf24011966d6.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 05 Jan 2024 06:33:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704465218; cv=pass;
        d=google.com; s=arc-20160816;
        b=ggxHYq2Nlh5O2WfSN9Rsav2mIF9TKbrFflErnvlxrvkBsR6cQIxsF69EOL8YTD5SX8
         5ep68OcBoNRUCfD/U+e9MsTnxxpd/ZaXZdhO5+x9jTC0ocugEG0DvE52wtPq9fR9zphx
         lxWu9xNvPxPPVhEzDC26mlKVlIy4gYsI9EI7WMy/yOaRSWduTSTbzBA0Q+OjnvwBUkvU
         o0r+BPyXCS+KKvU7Zr2CdFiGiG5j+/gDr31v6qdzpNkm2S2ubnVypobjeYwVnvCuXEyc
         aZrV4zrdQPA2SbqbdoCBtwjVxCYDNQxVYUSjlFi+5iTg1O2VmADmyDUqsWlsOLDxd3xO
         tcEQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=uudCPo7tpzvyug7RNKIguttWYqyosjqU9zavgSVtudI=;
        fh=5l+fFvxKOKoIwul6Y1zzzmXWDgRES562r//eGnX9aQs=;
        b=R/F7r6WLA5XVsXSIYulVwupWSuDNwdyeS/+3DB2mcQ8UrSRGmV0xgcwd5pAoIcOHVj
         fRq5QbYe4gsFkKl8AeE5kNJvEemV+MIO26vSG5K4/vXL3j8+5tnUra1dZAAHnaCHW/FX
         dQFPPgSdB0B7Snb+N827i3jYhi4Y0HaCsXRqPv3Nb5EF74yZQs1zARGEgNp3QFmIKxTb
         H8v1S1CTYXvrtQm1i6IyqPUQW+CIZPeV/VMo3ORyr47RLwBVwUIHjSiDR1GJvcVhsIOe
         5dALYKq8Ap4upuFhSpCW6cJs2X+YEplGxCB/xm9fY4LeyZfDA8WpghCEdnp11Z1LFm8a
         EMRQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704465218; x=1705070018;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uudCPo7tpzvyug7RNKIguttWYqyosjqU9zavgSVtudI=;
        b=N9QMK61RrXLYQ5Kfv+0iv30QSaEnN+1uzH0k7UsJT57hb7/ZDfJa4BFUznTl2dGjFz
         c5VtIlh+3oFOnU3PRjxPYcMYtoXjw7ryZ4SYUmecQMKRl3A0MIqJvF0ePSNNi3QzRWjJ
         v0Utj0mP6Fl8xKtKIac/6RtNTiWwKB0GQAwocFnFTAqK+KaEbo7+p04wHB+SqnDg+PDG
         JuieeK4WZgzkHmN83pApk0cJYHOoSGKyMi8LSD5GQxt3WH9E7CNzs0k92EW3zLb7Skst
         o7L8fZ3qKvXcOrHlI5USQEqv5cF/Q/VExmwn35K84ZE7nb+b/FwiJnYeWO37Nu8vzk0o
         mf8Q==
X-Gm-Message-State: AOJu0YzWQaHHlzNLQjDgCkGYyXucedTBYbUELOHsSEA5QigNAZYuRZYz
	haySnyp/lNajUy6/vhwkZbrRC93rlqCVWw==
X-Google-Smtp-Source: AGHT+IETnV4OMQvnnK6We4a6cgJyrWqvvdN68kpewtpbqjeovJ66XQq/X9ydQtg/ZSApTB6bpiZUpg==
X-Received: by 2002:a05:6214:d62:b0:67a:a721:9e92 with SMTP id 2-20020a0562140d6200b0067aa7219e92mr2262777qvs.67.1704465218156;
        Fri, 05 Jan 2024 06:33:38 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1944:b0:67f:143c:57c3 with SMTP id
 q4-20020a056214194400b0067f143c57c3ls243230qvk.0.-pod-prod-03-us; Fri, 05 Jan
 2024 06:33:37 -0800 (PST)
X-Received: by 2002:a05:620a:ec3:b0:781:5c55:d7bf with SMTP id x3-20020a05620a0ec300b007815c55d7bfmr1975919qkm.110.1704465217528;
        Fri, 05 Jan 2024 06:33:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704465217; cv=none;
        d=google.com; s=arc-20160816;
        b=KLzWgtk2Ff8RyM9dY2n1ETSo2AynuQx/HwBrcq6PgZLr/Wq9U4sO9kDiUefo903+pw
         j79LLULiONNnO+wJjY5M3hz1AMk6IAT6TrmGaTYuxjkBkAw3q+QZOy8lTY2hs6JoapOX
         cx6TSO2Nl14SCRt/2qpmDaN4kelGfrY2kEgXSm50wiwT75/GfxBIBDD7St+QHt7efYfS
         TUj5U0dyyDNJ8p6dyKS0342K6yW685Gi+3cTAR1F8XZ1t9TIVDMnhxcaz1FFpi3fHCdH
         XYHhCYgvrZ9QNEQRmkBlXhjHl/ui+vyFZjeiq7QaLBknhmC9Fe7d4rWTbef7EWHML4Sf
         UH2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=8NRYq/WkDD42V/k3bqpx3sCCWkCz2IyRzqVBfkSoWhg=;
        fh=5l+fFvxKOKoIwul6Y1zzzmXWDgRES562r//eGnX9aQs=;
        b=AGgznwEMqo1nJvj5lOhOA9ea7Ao0gzyNILE+AkZOAJAObDXX3Hz9pWxnPlvAvREkz9
         5DyMe+XBeEqAssKkl4VBhGKzp2d3hxs0mhZjMO1N5bpupEmpHvK9DQnkgzJV8Ez0Kx7y
         QdBDfB+t31u7FlyDmSHL63AvbwqaArkekSxnpsar1+s7SHQKLHoqofr3R/jykVtl6MzV
         e6Lz9b8qPLjtESvHbtLAMHAJMufZ2QBBaq6ZH+LWNG6oHmLYL1yBMPXwzfnVDRiacZ/G
         wjSwfimdMKu7JS8Zw2oKvOrpdEhDt5KCZt0V4BJnLX/hHibDi40C4slzFQh/Mq7ROpOq
         V5EQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y3-20020a05620a0e0300b007815e61f3dfsi1532240qkm.322.2024.01.05.06.33.37
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 06:33:37 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-dEczi__1MdOUkpJNn1A7xQ-1; Fri, 05 Jan 2024 09:33:36 -0500
X-MC-Unique: dEczi__1MdOUkpJNn1A7xQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2A0086C047
	for <linux-cachefs@gapps.redhat.com>; Fri,  5 Jan 2024 14:33:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EF6A31121313; Fri,  5 Jan 2024 14:33:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C82BC1121306;
	Fri,  5 Jan 2024 14:33:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZeLAAf6qiieA5fy@casper.infradead.org>
References: <ZZeLAAf6qiieA5fy@casper.infradead.org> <2202548.1703245791@warthog.procyon.org.uk> <20231221230153.GA1607352@dev-arch.thelio-3990X> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-38-dhowells@redhat.com> <2229136.1703246451@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: dhowells@redhat.com, Nathan Chancellor <nathan@kernel.org>,
    Anna Schumaker <Anna.Schumaker@netapp.com>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>,
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
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix oops in NFS
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 14:33:32 +0000
Message-ID: <1197168.1704465212@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1197167.1704465212.1@warthog.procyon.org.uk>
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

Matthew Wilcox <willy@infradead.org> wrote:

> This commit (100ccd18bb41 in linux-next 20240104) is bad for me.  After
> it, running xfstests gives me first a bunch of errors along these lines:

This may be related to a patch that is in linux-next 20240105, but not
20240104 ("9p: Fix initialisation of netfs_inode for 9p").

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

