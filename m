Return-Path: <linux-cachefs+bncBDLIXLMFVAERB4NEWWYAMGQEPDSQH3Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	by mail.lfdr.de (Postfix) with ESMTPS id BF668896FA1
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Apr 2024 14:58:26 +0200 (CEST)
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-dc743cc50a6sf7354774276.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Apr 2024 05:58:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712149105; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ly7xCj6RfF0/ywqIhzsBR6Bh5WKULyM9z9G/LVWrVcpaDDQ8/b05GWgc0j7G259c0X
         0MDvkEln8uVxPUuYtfGKp1aFM5pJwZ/y2mJA93n7ciyUKMgEBducCa46lYTpHyVwxEQu
         mlRypgPlYwL+Tw8TrNdotX+vWaTY3Br04Uc7LFDl1GK65rdPgAL7tlBn6ZvqmlwO72D+
         CQ67e+giPvblrdxzte+CD3GgeRkTzYp7zSmBzLrjGo5/r9JHHqvBl4AlYLt7exZmagEf
         wQT3AS6Wf21H01NCvh+yhTbFam365mi+uDAvIOmf6dwleQf3TriRrrjno/wgZIXSas9K
         fJZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=TojwGxEBDjcJwqnW328DdoC4+7KBuwjrQ3friVfcozA=;
        fh=ahdUd4QK2G1nNvHygBBw9o2XmApIb4HVj/rHb194tjw=;
        b=T/JKtnJFGRDuUy757VWnoBjEQsQ0HGrTHlRdh/nE8VBGr+1z03k9T/58X9Ba8rzRDu
         f3JKozyE+8EMgMpWvcmQ37gsvXRdSbyh1NApAFvK5tKCLoLuwwjI4W90mbsbmVmk5hST
         N+McepDwu5S3HQnAO2ZZdEyGJynF47fF+TMbPpRyGzQBcmqiimiJOISzrIziy0Yo2Jvp
         adEk5hgf10kHrGPThdQNB2aDkF5kzPvHU3CBNBqDj0Kr+yTmqUxoRiBM1aU+VAIHjvce
         mmfn2PTXC+0WWmUVw3MxSgN+igS1QLUG0mnvYzm+CreVAoflPWv5ar/31nDnIilFbvQP
         0UIg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712149105; x=1712753905;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TojwGxEBDjcJwqnW328DdoC4+7KBuwjrQ3friVfcozA=;
        b=YRllybVTznNn7ktrC0jpX50LzL7HJubUoKKnQ8EKWSi5aqVRq7czRVocpGQz1ZZ9Lp
         6terqmfpmJOG6Qfi3XVxl3/B31KVpy+RwnrYEYvl+Stpy7LOg/ZxJ57a3zyD1CRDM+uz
         4r18PH0elE2gtAykRG4AWkGpjTpWGlMAzR+j3JSMw5aCv66M27I5qc0sSNgpV0ytnH/R
         nBr9NTDSx9KZp5VPS8vbj/IZa3muMFuGyDVC3QKmuQkCIj1EWyyaJHVhX0Nw34UN3Fo8
         MSdijetccfxTekN6RCWiMbuIn03gLhDvc0HEZP9/aszMm5f/SiLP4vNphgTS8WDcRbQY
         oyCw==
X-Forwarded-Encrypted: i=2; AJvYcCXiDZ1uo6KAJtmwtYhZ3h6GXPj9/wNA7p4v4kkymCqIueXwSsQqDFabvganfspUssxl3rqyzlJHMP5gTiyc0VRxO7kQ0ZIw/q2P0q4=
X-Gm-Message-State: AOJu0YwV1c4vKKZvujpVXZk16zWyRM/OYwppb7Vqw1Kf9Ckv8hpvRJS8
	83L3SZy3/IkwwzKWun5KG7GSy7ENp31NVlawGLpl7Xt8Wl9nSHo6+HQJMjuG/xE=
X-Google-Smtp-Source: AGHT+IENOL4lW3KC/HkBmaAWxAZB6J37/jVia8r7USrvw2ie7zRObKvYb2eO7snhtaM5voAFW2QjeQ==
X-Received: by 2002:a25:2614:0:b0:dda:a550:4e92 with SMTP id m20-20020a252614000000b00ddaa5504e92mr2514796ybm.46.1712149105605;
        Wed, 03 Apr 2024 05:58:25 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:3627:0:b0:dcc:4b24:c0da with SMTP id d39-20020a253627000000b00dcc4b24c0dals801114yba.2.-pod-prod-02-us;
 Wed, 03 Apr 2024 05:58:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnfmWCL0o2SHnx/8K+15jVbG8Q/AaimNC4c5KMAwy3ozvxCJk4uzSxsUBb9ByfXRVIo82Hm04MiIOjIqsg1wMjZDP8C7ax9sU/W05Yxmo=
X-Received: by 2002:a25:a144:0:b0:dcf:a4a9:98bd with SMTP id z62-20020a25a144000000b00dcfa4a998bdmr2363127ybh.20.1712149104818;
        Wed, 03 Apr 2024 05:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712149104; cv=none;
        d=google.com; s=arc-20160816;
        b=CFWdUJrJaN8xsnpLIKJyEZ28g23gEeMUyLPUx2rNptWDE1rvU+N9JuTbap8+yiYSd7
         Ulz+elKXafuM9z7C+oLzCcrqNtmoTbX2ZJ5w4mL8ZBQUmxnk9kwSMp89/i1Tn58yK3xO
         yGRQEnsNlVB3wpQtYkVvO/7csciPipcYJi1D2E9+1a9BkAbZRgSHveqjLTxTY/BStEnk
         dsu+/AKmecbJ5jRVgXbnKI40QcLU9VzPtoNmT2J5W/u7PnOPI8q8RI8iXIEh6/smm1t4
         Ib2eALnNbxfdkKjnUeImQULPJqp3wBoLgX1PAOxyVybE7DNmzJYorUKaXljVuMG4uhPu
         hvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=5DGnORPv79MmjGVc5naevaHP+scfzBDnCLP3n2Z3Y4Q=;
        fh=OTg2WMHJtOqcpGTWyrCVDzG+wPN5q7xsQc52pUkpGv8=;
        b=rPyVZaclYR+4IkSYJvOzCTh1Y3nTVSrZZctGpajuSvTyuTnYnz85zbpE0WiT4NMIR+
         uUZq0AlHUZtBt4/oCquLQX7VnFnRsHM7AJbec+zSmPAndjy9n4DbDMgVv9C0Mocg0Ce1
         vQHAYyB+62juQKDHcgrXfSuEl4Izk8PCzaPqSM38X2rUrpoPIzoQYZ61S5RZ2UrLAbYf
         zPYBpNkojTwphBRRHDgXR3z7FIu+V8Lax8Jg3vfx5R0XWmVT4MB7plnXkH4YJgMQTj4P
         dXSdLdpIXFQ91amJyu7RjonXSqICQgs57GQyJqrt/Xf+Vg1lQr4Edgq1KVnJYHVMAvYO
         Nj+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s28-20020a05620a081c00b0078a3a9d35c5si13976637qks.298.2024.04.03.05.58.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 05:58:24 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-yrq-o_KJOPKshGek1l89Og-1; Wed,
 03 Apr 2024 08:58:23 -0400
X-MC-Unique: yrq-o_KJOPKshGek1l89Og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BFCC3C0F183
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Apr 2024 12:58:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 28FDFC04121; Wed,  3 Apr 2024 12:58:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E17DAC04122;
	Wed,  3 Apr 2024 12:58:19 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240403124124.GA19085@lst.de>
References: <20240403124124.GA19085@lst.de> <20240403101422.GA7285@lst.de> <20240403085918.GA1178@lst.de> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-16-dhowells@redhat.com> <3235934.1712139047@warthog.procyon.org.uk> <3300438.1712141700@warthog.procyon.org.uk>
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
Date: Wed, 03 Apr 2024 13:58:15 +0100
Message-ID: <3326107.1712149095@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3326106.1712149095.1@warthog.procyon.org.uk>
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

Christoph Hellwig <hch@lst.de> wrote:

> > So why are we bothering with EXPORT_SYMBOL at all?  Why don't you just
> > send a patch replace all of them with EXPORT_SYMBOL_GPL()?
> 
> No my business.

Clearly it is as you're gradually replacing APIs with stuff that is GPL'd.

> But if you want to side track this let me just put this in here:
> 
> NAK to the non-GPL EXPORT of writeback_iter().

Very well, I'll switch that export to GPL.  Christian, if you can amend that
patch in your tree?

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

