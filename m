Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOMH7SYAMGQEUIKVMXA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 142478A7842
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 01:03:23 +0200 (CEST)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4365ab4c663sf46712191cf.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 16 Apr 2024 16:03:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713308602; cv=pass;
        d=google.com; s=arc-20160816;
        b=yKK50AD7SpQiYA5FVPkjOWokGBck81a1apc93d4wHL3hpiTH14qmdRKKQckQFJoQQm
         KOtj8bK4/RSI+EXPuASUDfNfwI3hozf/7kXbJEkz3U+GYJsWyVJvVJyPcet4IWOsQ0Bs
         b1QXkmMr1ovmQC+As6MK2J2JBxguSjpNBqLzY1CGaHyNy2lXGdi8OzLQ1LIFJCGx0PBW
         ouqZGYxTF02BSrj7rdQFv4PUY0DAzPjS/ZkBqELV3RL9o0bS536GQQxSAc7j43uGhDzR
         qwKYiOwuX/5/als2VHLvhicGqXDujcQeNvvBj+Cv85RjF22vKm2dI92/gkq0kVgkpiXA
         qI1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=R5H/FvXZU76hdpy5i8rsnxdDYieaoVRV+0kIU8jSg6s=;
        fh=G3Ev6wqMKDxbHhpYnqFBpcS1WWLkYoMHES7bYSiHJok=;
        b=nHb+XuGb6GhXwF4YvIlQDLIrTLyKXvjvoCkABOW6DyAwftoDN0lvthTXqk5o7kOwfX
         u5KPzfOHhg+EQR9syhOCR+MANAUky66bIzuNJ5vSBt2kLTeCgBjf61O83G0xq2tdEAFK
         3nBh1S2DEwEYveQ4MiGPNxN8LsCN0WlpSCrA6WYD98nn41d+inL0Wu0HBxtkHXfl7j8g
         AQTWViuskPllv/qQwrmDgGtlTd+GZDdYMmlwXf4+hsq4jrGtvh8QXH+kc/KUbKqyMAju
         k28AjU3LKCwejLfYIObJbLN+1RYpfbhouokir+VG81zn0gsVFNl/snj9t9FPBHfh+pnY
         T1Mw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713308602; x=1713913402;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R5H/FvXZU76hdpy5i8rsnxdDYieaoVRV+0kIU8jSg6s=;
        b=uZreQt1Jf3E+l8fZlE6AaL6YNG+YCCMAnbf5sBYFSrLKZNK5WC8fpdr5tm2ZvlXi8K
         54LmQH4kFHRjU8Dfq+OZjVZzaJS5ovAonES0ULZlrdgZOMpvVs7C8FceQm4KrcIrsCYi
         LxXHQWtfnykSVIKo7ZY3fj7JLCR88CpvdDaSUthkrOhZOWF9Dk1xGg088i1S71SoPv+L
         RkDHIstdZ4wnto++FRP9sLJONAWBmoYqJ6bXZSIS9ykaFL42D+rSvlfsD5ml7crfhohN
         C0O2O6aheHfiA70I9XUaig1X/0TOhsWeZlyrxQwXACTpm1/fmiRBqNR2XpW0LI2OGFek
         0dbQ==
X-Forwarded-Encrypted: i=2; AJvYcCWEQhi9FDT+IUrdBdbgo4H5tavCRtF3ElSOuezcPy/CIv0Td9F/VwGPeKUSrRRkxRPFHp7efVs3cY/7ZyOFQEhsq2frUcEZ1Ady3f4=
X-Gm-Message-State: AOJu0YyY+wLMUvO42e8+nyR3kvyDBNv+IPFKsDPYkjd59fZUTq3d6dt2
	EpmGyM8yOEiNfwlabdWotesJ0/MnXPEgzxd0vWGN7q7eyrycPrwZM5YX6qA1dY4=
X-Google-Smtp-Source: AGHT+IHlJ6I94sTqfOmxFem7GeeHPoyldVmD2Qqu8HAElzNL+euuZvsqACLN2SKVwMnSlLyozXI7yg==
X-Received: by 2002:ac8:7fd0:0:b0:436:98c3:4b1e with SMTP id b16-20020ac87fd0000000b0043698c34b1emr16054550qtk.26.1713308601986;
        Tue, 16 Apr 2024 16:03:21 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7e96:0:b0:436:ab0e:c3ea with SMTP id w22-20020ac87e96000000b00436ab0ec3eals2720509qtj.1.-pod-prod-06-us;
 Tue, 16 Apr 2024 16:03:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSEf9Xqq+gLC0G8iDq7UXqHrdisJlhpKYEFAXkP8NAPSNqbVKK3COB2c8k4E47zwqhrLbFhmDCAXDt76IeWpaiUoWJUguRPwF/dLdjRXo=
X-Received: by 2002:a05:620a:8c4:b0:78d:7054:1b89 with SMTP id z4-20020a05620a08c400b0078d70541b89mr14509935qkz.62.1713308601251;
        Tue, 16 Apr 2024 16:03:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713308601; cv=none;
        d=google.com; s=arc-20160816;
        b=tdskoggAlWiuEtT2PIHONO+M8XchETSP6cFGbtZlzSuBMO2vaCUH42HFrUjDI7Tdqu
         hPsxXU0ZydZqsF5DKYk6GuMyLE2cCuXJemw4wxvbfwjDDon8du94GdsCYA+cgo5FWkHh
         tp9AZ3qYd+7721AHLub5TdmOC7GmOqk/bLwsCYJDRvv8URC1227bOdkCDP1zLWBr9hkY
         k/+o0NB8b4n1iaF1QWNtQgky7gUK4qlJodhLjpJUtvI2JukLlVioG0iOVKOQWNWFXBYa
         PwPO4DcMmiCgIa1bFCwNV39Yod1+PMBw7BADwnwoL8BbQVfCtlOSnolGKwTn6Ll2nKiN
         9l7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=omkePlcDB8enwqcFXRle7B6BhP/V3w40pUO+LmEoCqU=;
        fh=7gOFpuAQ0yAoOab2uNQ6H1pxrsYhhlKoHW6cDGyURI0=;
        b=FeaX5+XABpez9AnhVY+5v6CfHPSUbpsCWW8SnkZpqHKabnvmi+KLbfo/UHfGUhogqK
         bKbrdWFvgDymZRXgdVUMZ+GNqn4z8AaYKVCG7qPRIR9wcnmm1SoeLw9blK39uKLiADMH
         Bu6LswvAeJsmLLQuuuMpgbQifCD2UkdxVhtCH38tUxOW9FJZD2pRFBs9z8dHhLXxGpO+
         n55Easmo+DLFocpmGBflU1m84VLL7aM02Jev02YJQZvx3WKBYEQ9DTv9YFabvXR7PUvv
         Kv2eZP6fSzt43dfBbXltqZJPZ1ays1UfUXfsPL7Xzsh256GjE+8/uOtsAP4j/Mqw9ltS
         MH1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id p19-20020a05620a22f300b0078ee2e2fa16si6170565qki.563.2024.04.16.16.03.21
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 16:03:21 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-hGZxr00jPIG652QuqGOv9Q-1; Tue,
 16 Apr 2024 19:03:19 -0400
X-MC-Unique: hGZxr00jPIG652QuqGOv9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5FCA2932489
	for <linux-cachefs@gapps.redhat.com>; Tue, 16 Apr 2024 23:03:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E253623D71; Tue, 16 Apr 2024 23:03:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C3961BDAA;
	Tue, 16 Apr 2024 23:03:14 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <9b7de2417924192fb411744171015877c1d4c677.camel@kernel.org>
References: <9b7de2417924192fb411744171015877c1d4c677.camel@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-12-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
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
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH 11/26] 9p: Use alternative invalidation to using launder_folio
MIME-Version: 1.0
Date: Wed, 17 Apr 2024 00:03:10 +0100
Message-ID: <2756052.1713308590@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2756051.1713308590.1@warthog.procyon.org.uk>
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

Jeff Layton <jlayton@kernel.org> wrote:

> Shouldn't this include a call to filemap_invalidate_inode? Is just
> removing launder_folio enough to do this?

Good point.  netfs_unbuffered_write_iter() calls kiocb_invalidate_pages() -
which uses invalidate_inode_pages2_range() to discard the pagecache.  It
should probably use filemap_invalidate_inode() instead.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

