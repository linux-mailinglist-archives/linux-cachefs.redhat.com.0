Return-Path: <linux-cachefs+bncBDLIXLMFVAERBK4A7SYAMGQELCFEKXI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B6C8A780A
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Apr 2024 00:48:13 +0200 (CEST)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-dbf618042dasf7533511276.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 16 Apr 2024 15:48:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1713307692; cv=pass;
        d=google.com; s=arc-20160816;
        b=0IrQzbY/SOKqdpojAICX3scfF0bB9SVz97Ul/EcOBQVti1KY2wtY9wkAxII1bAni9+
         KdfFgOEYob/UjbDJUBi6BXdisNCk7XmkjTJpJLoKqBp0Y0IlEu9NFgc4hyOxouoAMjrI
         /SKouYWOOZyLcex31obAw2rfJACb8aeoEWlU5zPkxA6FAYZ5HoDPn8IRppztCiOuJXCm
         gJKleRkEEKGWO+jwtc5AW4krQn3Cn9KcEgb6ZacukRw/tfmsfhf9Hpg2bHSPqkBlQ5x5
         mjxzMZ2/+7TkucGYZFNmjQ7v1KgaESVFVYtTlCdCK5qkKXx9h7viDVcRJhoKLlWeik9K
         F6Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=wVfgbEhxdVAb+FNAwz12PjcjKyMdD+2zfiFMtG6KdBI=;
        fh=P+k7s6wJqIrATVHzJgtHjiFX5IUKbona9Z21bkiBTlY=;
        b=ntNy3l127xMPmlXJX/zC/sUyTQ8FiqFeOBunbi7V7po7nLgQu0Q0/sMjX4F2CNwrsV
         5OXEDDoC1Ogc8iIG4blGMLXSxLTHrXUgApwhfO23qyyvBrjE5Nrh5JLR22MKCASXcs6o
         kopgibpvgnqDtPVsI69XLCi7G87RydvxbmFP19+OWHSeQykV///IWgXOZWfvLUBZlmSJ
         SW1vHao9Plu9nKInImFCb4Uwh+kPzp7HP0wkmaZz+4RJSqbWvJmoDgCJVRtAcUQ8BrpQ
         tNh/w4rFZClqcFfcSW5d0CL23xChMQWHdxYB/PvgtJ7gCZmN610KywqqLyMP9GXDtSTM
         yitg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713307692; x=1713912492;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wVfgbEhxdVAb+FNAwz12PjcjKyMdD+2zfiFMtG6KdBI=;
        b=aMAiNInvJFPCAnbUO8eE93GuVcKG9Dd+eul3RHs0OYDikCjd4TaaENs2q+dZJ41k/m
         fKwqhSJxm9+fnzzfirX6J7SQJYO9YP69CFhofrOZ5uiOvc/frZ0P+KadFTXxvOcEiGap
         bTtjVGqm3AFdggGRY5c/aEWbsHNJCqrHhYmh+rW+zHPCH7l1sIi8L30M7WYQal3huMcr
         U29Vd+LUotHi/NIu8+v+4ZANoOPQ0KNFJBPNxvIkLQzLGHBk4RwCEnDZfxKIVhoGyvJJ
         cYpHQNj0ETuotlGWQVgjrMtMTtn+0LDbgyNlpBcz2MHzXEQmKbmxxF+vQDQJDsBFRLlL
         bKqg==
X-Forwarded-Encrypted: i=2; AJvYcCWX0IdrNXbmNyN5Qr2KQoHebkDP10EJTmVpTcVywxIQwIjV9MK27iTSfOy3y33+bZZPVVNeKuzeCWrx6iJ7ogzmArCZBFr/L2mXgNo=
X-Gm-Message-State: AOJu0YxTN2+xKyQs98tqhF9/tXN00zhoUVg6SZY5OP2blMBNJGxIJzu5
	3zRY6oWG4ZEiQqTL+Kpja8rVa+8w45L2IDvn4PBgqnYL5pxJxRcIte/PYaVojKM=
X-Google-Smtp-Source: AGHT+IG8HI07qJiyO5x9A4tcZ5cbAAq1J1yH4oYDCG6u9/TwxSsPKDIX75l/ZWhRY3Rbw5dLW5fajw==
X-Received: by 2002:a05:6902:90:b0:dcd:97da:926e with SMTP id h16-20020a056902009000b00dcd97da926emr13899347ybs.13.1713307692070;
        Tue, 16 Apr 2024 15:48:12 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:7206:0:b0:dcc:8ecd:49fe with SMTP id n6-20020a257206000000b00dcc8ecd49fels2475012ybc.0.-pod-prod-02-us;
 Tue, 16 Apr 2024 15:48:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUx4L/9ava3zbUZA8pK7tOZ154jPqX7tDosiNLXKRIGFNkHCieofpzzcy2VeWvfh3aIlQLPzU9m18ZiAspv7wm2LnZ6tZpuvYo++jq3UVE=
X-Received: by 2002:a05:690c:39d:b0:618:877b:72b3 with SMTP id bh29-20020a05690c039d00b00618877b72b3mr16880513ywb.30.1713307691382;
        Tue, 16 Apr 2024 15:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713307691; cv=none;
        d=google.com; s=arc-20160816;
        b=AZZzqP+rfMr59FUktCCKMPXgOtw68UmJOr46VorIcgefeboeEdn0G1PM9+pvVY4m4o
         YWaVezjfpygkJDcwHjqpL2aHkNI5lAGB3Qf5hI1G74Uu/pTfMOvlHU+JngtbgHWxkvpm
         RrpfeRXqiyww/Nc5Q01+xwh5NRAnRyXRbTJiFTMlytNq4S/L5esw8PPcinJhritwIW4D
         kkLwm27ZrAw/9i/F6EeQvjuBYsFS0J6gDBkQWmYoTbsg+kmsHQs2fEAJe16lAJ7QLweC
         Kti+wFGe/DXAV5Xqw9D/lHbnzAJmCzQ5yoGvP9waLymdAYK+phfCHai0KIZcZcgH7Zwr
         4shg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=OzQAe2obBSKDCA/rtQksPJv6hweJcQR5H2Di6lVo6SE=;
        fh=12Aq9faxsP8TRA3a9E4jKzqwjH+XMDjMUr7HQt1qRR8=;
        b=xT3QxzhvNhrGKYrk0vnuwGdcI77HJ135eNEGAEwZBNZKw9RW70rE2BzKTIEXi1huyi
         ZZnix+cUsB5xjbUn9p4WEIW2+Xl/IcZNG+ktuhM+nvPdp3mSfAoknBIohbHSB5lMDAE/
         ggv2ACFaxbG0VSB/b1B3xHr1EAfKiBFYzotd3V0JvdVBBUqk9wgB5oNhbRY0kLyJ/dk7
         0KGdwgZ1SjD+IOzGC5OBo8AQfDmKs/Bb17a/FafxhRzJhD5XTVVgTA87XIMShwboycsn
         yHS55G5tm8JNH8nfpBSc46xX3o0PjeKqTHI4JUNcUrKkhhfEyTJTgXGlWSLzdSb/Szr6
         XtyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id vv9-20020a05620a562900b0078d5f021c39si13859121qkn.417.2024.04.16.15.48.11
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 15:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-ubyn6Ui_P66VUdL9CWnV3A-1; Tue, 16 Apr 2024 18:48:07 -0400
X-MC-Unique: ubyn6Ui_P66VUdL9CWnV3A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A3561887314
	for <linux-cachefs@gapps.redhat.com>; Tue, 16 Apr 2024 22:48:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0420335430; Tue, 16 Apr 2024 22:48:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.10])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCEA51BDAA;
	Tue, 16 Apr 2024 22:48:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <b6b6f41b9de1fc4128c3b3fe5aefc82d07a2347b.camel@kernel.org>
References: <b6b6f41b9de1fc4128c3b3fe5aefc82d07a2347b.camel@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-4-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
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
    linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
    Shyam Prasad N <nspmangalore@gmail.com>,
    Rohith Surabattula <rohiths.msft@gmail.com>
Subject: Re: [PATCH 03/26] netfs: Update i_blocks when write committed to pagecache
MIME-Version: 1.0
Date: Tue, 16 Apr 2024 23:47:58 +0100
Message-ID: <2755236.1713307678@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2755235.1713307678.1@warthog.procyon.org.uk>
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

> > Update i_blocks when i_size is updated when we finish making a write to the
> > pagecache to reflect the amount of space we think will be consumed.
> > 
> 
> Umm ok, but why? I get that the i_size and i_blocks would be out of sync
> until we get back new attrs from the server, but is that a problem? I'm
> mainly curious as to what's paying attention to the i_blocks during this
> window.

This is taking over from a cifs patch that does the same thing - but in code
that is removed by my cifs-netfs branch, so I should probably let Steve speak
to that, though I think the problem with cifs is that these fields aren't
properly updated until the closure occurs and the server is consulted.

    commit dbfdff402d89854126658376cbcb08363194d3cd
    Author: Steve French <stfrench@microsoft.com>
    Date:   Thu Feb 22 00:26:52 2024 -0600

    smb3: update allocation size more accurately on write completion

    Changes to allocation size are approximated for extending writes of cached
    files until the server returns the actual value (on SMB3 close or query info
    for example), but it was setting the estimated value for number of blocks
    to larger than the file size even if the file is likely sparse which
    breaks various xfstests (e.g. generic/129, 130, 221, 228).
    
    When i_size and i_blocks are updated in write completion do not increase
    allocation size more than what was written (rounded up to 512 bytes).

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

