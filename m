Return-Path: <linux-cachefs+bncBDLIXLMFVAERBFEUQ6WAMGQETZG5F4A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C949818CED
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 17:51:34 +0100 (CET)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-77f5e12dfdbsf887918085a.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 08:51:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703004693; cv=pass;
        d=google.com; s=arc-20160816;
        b=hRZeBthm8+473V06w3R7uIkL96ksGXS7eE/4QqaTpeohniNidbt3ktKrmVWYxvkM3N
         wr18U7KK4XYqmMlYZeyvvOQQMjkNh+d2iIqbiHmh+DiR+DGtmd8aCwclxYkJO97rMkV6
         Y+TRiwFkNLzr8U0+R8TMkLHcMfJUF5802AG7P3Ktzeu1K5quVLnH8mgAsDKlu2Gxhe3/
         HkZjNdHqgHApv6NjqP4IKkcEmD/h1tm9zrz1kJzGx9ypfUE2iv5AM0Go9JWV6frsxGQC
         0R4ZbcvmDACLXO6vVwKOeVvhyY8M9NcozhpDNZKtVOec0oxEXFC1LHE9LVzXz3ewNYFc
         /j0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=U5YtN8gAFbEmscNjGvdw6hvU/E246fzokoAy/ut0Cdo=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=gWWqU3gUN+ldFTkJ0R7TPs6JghG5OHoTQqfpi3c+ViRiObqiqLLCnAYfslp0wL+AUX
         +bmbdq9YQCx+ydiSJa8dXMPaH/jWIxvo9VO1n+pe331E1BlQ8gx1wew//L8iJ7zN1y9z
         tN6hQryFow0GFbJMHBpTG51ZA9kvFD16TyTk70b96Qk1WX7+bL5KEXLOGhL06K822n8d
         OsRNXw2bOLWKD86BEBMUuCVN6suHddaS/9P1JUlFn0rRUWF46g3gV+NgqrChCn1sqPmT
         wKUQrILfdeNTIVLdv+SwQ2v+K8NGnLlA46eaknpy+euY0X5o21PaJUjJNoT1nVaem2nT
         dy/g==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004693; x=1703609493;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5YtN8gAFbEmscNjGvdw6hvU/E246fzokoAy/ut0Cdo=;
        b=sv+kk97a+OByhElyQwVgnqOj0eWfA8ekHivzyEToS3auEuuZAMA9MrvrZVvloz0Dqn
         vKa2yGcyGdbhbOoZZkrImPQN4Q/pDIMZ6aeeXxgeIc13spjqx0cOJqQZjskKjwpzrFjz
         5unLucl1PyQFOnKoqNonrso3bGzMnD2HUVhvyvIaXIGzOhZf/w7RwvTxQidR5FTSutqk
         y0nLBlf4jcPBVqi4DHE4wnrSeXcrin5Dc9fg3QJ2IPNzuowhLpyXi8AAs0arGgDLh8EC
         158waStk67zkJl8bi8KyzvLVFuT5/p0y4bmjtczCI4YgkZjyLWHW5i6W0B1ZuR2KbJf7
         8XnA==
X-Gm-Message-State: AOJu0Ywi5ML58j8Ng8Stcw/9ASKfySkAEUcISntGZCRi01eIiPhiHYIn
	tk7u4ZHI5hQfmFNwyFnjVAVLcQ==
X-Google-Smtp-Source: AGHT+IGNBXihOApr6Ujzl3OSvHw5xC3zMpI2oucZj/43np32+w80YQB1tgreMmooJbZAh0rLnkfUCQ==
X-Received: by 2002:ad4:5ece:0:b0:67f:34cc:1eee with SMTP id jm14-20020ad45ece000000b0067f34cc1eeemr2419647qvb.8.1703004692923;
        Tue, 19 Dec 2023 08:51:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:ed31:0:b0:67f:647a:94e6 with SMTP id u17-20020a0ced31000000b0067f647a94e6ls723012qvq.0.-pod-prod-00-us;
 Tue, 19 Dec 2023 08:51:32 -0800 (PST)
X-Received: by 2002:a05:6214:1d2b:b0:67f:2571:2625 with SMTP id f11-20020a0562141d2b00b0067f25712625mr1881614qvd.1.1703004692205;
        Tue, 19 Dec 2023 08:51:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703004692; cv=none;
        d=google.com; s=arc-20160816;
        b=Katn+q2MiV5YhCG/CyAAsah+UUBeo6/07BqW/FeYavI18fF29xloQlFns87xZOj/d1
         8oLRKJAgQjac0DUT9W8XA1qd5FLfsb0I2LNddZaPqA4dOy8SZjqL+zF00v0R2k5YwMXI
         UDSZoceCwbyPGRp5US4g8HPIp/9yJgWD3I0qLKLXqLLosJVJLkhxyTBJ3A7lf/3Oh9Qv
         36timYuQNRCkqk5JGrmaGtP1/K0G2spPsuSxoW5MJaoc2ek15tGggXeMfVZRTaG+clya
         NVKOHb1LL+pRmAC187KaR5nTRQWU+u+xAEVzWE5N+10ySSViW55t7/gzkd02DfI6q4+X
         3Cxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=jYfCaqwpPkqYac8J0TMIRzQM+f48rAuRAVIj72AOtH8=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=kxDJOLsx9SdSqcf1uyy4lDZQkQ/poJlxpIzJvD4V+PS3SRCphZbKt4IXKLMYM7YtZC
         uPIySkyQbqzyCU9+3f38ssifogU0dM84n3isPbr6qRjafc96C27E393NrQfxHmQ06BLK
         k7oRqIPyc0vvoWWKu1T4gSYjwM2A5YVT7yox1QbFBLAyI7xmCPwz54fcwZB4Uwti9GPC
         13hRhiFpSomP64WdqwdAg+BpV3gIbe2J1TFifX0m+nBC28DEP4Bdm1Fth4BvohvAPgF4
         oFcH1n6gK2SNnwk6pwtVwrtFtTHGzJaa8kxaGd/2ZQaDrw4Zdip5cKkSOeaoLjip4ewW
         vxxg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id d12-20020a0cb2cc000000b0067ef0702fe6si13322473qvf.512.2023.12.19.08.51.32
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:51:32 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-816UGW6rNHuxnEBe4k0thA-1; Tue, 19 Dec 2023 11:51:30 -0500
X-MC-Unique: 816UGW6rNHuxnEBe4k0thA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C63985A588
	for <linux-cachefs@gapps.redhat.com>; Tue, 19 Dec 2023 16:51:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 572BC2166B34; Tue, 19 Dec 2023 16:51:30 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 745142166B31;
	Tue, 19 Dec 2023 16:51:27 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d1d4f3996f55cb98ab6297844a51bc905e2ce631.camel@kernel.org>
References: <d1d4f3996f55cb98ab6297844a51bc905e2ce631.camel@kernel.org> <20231213152350.431591-1-dhowells@redhat.com> <20231213152350.431591-37-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Steve French <smfrench@gmail.com>,
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
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 36/39] netfs: Implement a write-through caching option
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 16:51:26 +0000
Message-ID: <1075260.1703004686@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1075259.1703004686.1@warthog.procyon.org.uk>
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

Jeff Layton <jlayton@kernel.org> wrote:

> > This can't be used with content encryption as that may require expansion of
> > the write RPC beyond the write being made.
> > 
> > This doesn't affect writes via mmap - those are written back in the normal
> > way; similarly failed writethrough writes are marked dirty and left to
> > writeback to retry.  Another option would be to simply invalidate them, but
> > the contents can be simultaneously accessed by read() and through mmap.
> > 
> 
> I do wish Linux were less of a mess in this regard. Different
> filesystems behave differently when writeback fails.

Cifs is particularly, um, entertaining in this regard as it allows the write
to fail on the server due to a checksum failure if the source data changes
during the write and then just retries it later.

> That said, the modern consensus with local filesystems is to just leave
> the pages clean when buffered writeback fails, but set a writeback error
> on the inode. That at least keeps dirty pages from stacking up in the
> cache. In the case of something like a netfs, we usually invalidate the
> inode and the pages -- netfs's usually have to spontaneously deal with
> that anyway, so we might as well.
> 
> Marking the pages dirty here should mean that they'll effectively get a
> second try at writeback, which is a change in behavior from most
> filesystems. I'm not sure it's a bad one, but writeback can take a long
> time if you have a laggy network.

I'm not sure what the best thing to do is.  If everything is doing
O_DSYNC/writethrough I/O on an inode and there is no mmap, then invalidating
the pages is probably not a bad way to deal with failure here.

> When a write has already failed once, why do you think it'll succeed on
> a second attempt (and probably with page-aligned I/O, I guess)?

See above with cifs.  I wonder if the pages being written to should be made RO
and page_mkwrite() forced to lock against DSYNC writethrough.

> Another question: when the writeback is (re)attempted, will it end up
> just doing page-aligned I/O, or is the byte range still going to be
> limited to the written range?

At the moment, it then happens exactly as it would if it wasn't doing
writethrough - so it will write partial folios if it's doing a streaming write
and will do full folios otherwise.

> The more I consider it, I think it might be a lot simpler to just "fail
> fast" here rather than remarking the write dirty.

You may be right - but, again, mmap:-/

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

