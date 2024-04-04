Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJFYXGYAMGQEZBRBROA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822489827A
	for <lists+linux-cachefs@lfdr.de>; Thu,  4 Apr 2024 09:52:06 +0200 (CEST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-69929513885sf24101316d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 04 Apr 2024 00:52:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712217124; cv=pass;
        d=google.com; s=arc-20160816;
        b=AFsxQ03ZU/2A/OI+m0cGLxCuugaMLYpOFxB8PdVrkLj/K0SAfD+tgSTMDsATOs81Gz
         TJr8T3SeAjlwbQUXpcTIqTHV6/I6hIV+hNUarlIL7EmuyBQemVxS1kIY7zMvPaV+Vcig
         wc2FfeGB0LioTkr5g2h24dDTI8Qon09QDDz9HQJ9TmdPjiScSKH1XCgymx3NuX2wKj1z
         zAh6dj2bC5ABAI5jMksCdY76YEOSwbklNaIts5MOvgPHjtyHYhx206ve4/uxkhikPOu1
         d2w6YpxGnPF/rgQybiIa18bKhJo7qAtgc5wT7SJQizKBo0kGVTLSG74JFTtJjmyNQzh1
         lB1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:references:in-reply-to:from:organization:delivered-to;
        bh=w5eLga+kxsCcZ3NOOheHRFSemxQABAL8eU8nKO8L9eQ=;
        fh=uRZ/uJ3ZJJbWLzh42lHlZkswlsvASAmNHHIUrM2Yhnc=;
        b=NiQ+88zLg3emGVjvoXCnDw4G+XRVg1RdKsf3j/4Sm+gedXrSSJLtirtYxiumj9nvYW
         vlenQyGGxplJZVG1IW7FeuhqIYoKAKQ87ND7rKboL0DuXj43X+4lBKN4AHXU8IbUatPe
         oyAp6NQlQrW5q5vDcpqk6nqqCuzhtZi3XkAFCAbOjUxW/npX5NHNuXe9x0a7nlxyJoeQ
         pjhQEBNUQpYD2RtMtOV+R5zGghX+Ww2lPajCGntmYCKsjnSB23+4OnlC61qqLVVv9g53
         V1nJv2hCUKWzbklNTtjoqHyS31hGfW3H4BPMBF5+GvZR47/r5wrHkf7/uoCY3IQblajk
         aWkQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712217124; x=1712821924;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:references:in-reply-to:from
         :organization:delivered-to:x-beenthere:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5eLga+kxsCcZ3NOOheHRFSemxQABAL8eU8nKO8L9eQ=;
        b=i+KJulQ0yRV0zWQ9Asg+0bB45eSXlXpTS6HWJW4i88biRHlByGom5RwiHo+Kskgpl7
         t7y6qgFl+jmiYGCfw6RU0VfyMyGJH/1euK/ka4sZptMY1SJ7XXWKrbEJpmRxG3qGbwnM
         k1hTGxnqrpivszOjhLOdvOokHqtAipTNNwHiBmEtPqtGONaMXfZUYeIDREsk+uqQctyB
         ITbZK3iF00lL+lXQUgqVqUhKjLdbECjJkqy8CTgZ6K2cBxa87NLk/B4/4qekgvezhGIg
         75wM6PreEN2aWESOgrIHuIOKgZi34Yk7HzT3soLVVed/NnqVAsfEnmWXAarQJHO+RkB6
         Lq/g==
X-Forwarded-Encrypted: i=2; AJvYcCVmzvNWCFe4N7HUg2uncwcN83huJX9ItQumcqv+5QzisNFDQKAO/d2axavdgBPVzVVdwThyk8qRm2b69P2/Kshf9HenHs1o78j/Kp8=
X-Gm-Message-State: AOJu0YzamVM+HNSRulNrD9GoJLYmq9WLqYfKfo8P+DDn/+0flTdCGBUE
	Tu97QJFJJAABIee+SuSV1S8iV2i4Re9Z4ucCXSlwv3KQvA9y50JRV28fNmrJn88=
X-Google-Smtp-Source: AGHT+IFCfTY91prNkH6ZQqFemSqzLrAplkCPGHkFoK0lFDe9B/8pKa9DtMyckVzfSVpL9yheYPXe6g==
X-Received: by 2002:a0c:f2c9:0:b0:699:36c9:5a4f with SMTP id c9-20020a0cf2c9000000b0069936c95a4fmr379501qvm.4.1712217124624;
        Thu, 04 Apr 2024 00:52:04 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5a4a:0:b0:432:d0ba:6add with SMTP id o10-20020ac85a4a000000b00432d0ba6addls1444907qta.0.-pod-prod-00-us;
 Thu, 04 Apr 2024 00:52:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzUEg4WJVNfxJPR3Ph7kw0mQ+hWl/xXAZQtc7uwg282IiqVnv2bOrSQWhqm7+sqrYLgvpAPh0cNMhucTC+CT2zaow8hxeHOUg0K4b8oVo=
X-Received: by 2002:ac8:5ac1:0:b0:434:4a12:e3a0 with SMTP id d1-20020ac85ac1000000b004344a12e3a0mr3007745qtd.24.1712217123580;
        Thu, 04 Apr 2024 00:52:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712217123; cv=none;
        d=google.com; s=arc-20160816;
        b=JTHJTe6L6j0PlM0vUEkO9gxB2H/UYg2+16ZX2BX1h8UgMCBhkZ9/m2UIE7BaPB7a1l
         S03gmIbP7CNRT2chMUdeqFa0PRvXjtE+C3i6jWnGoqkN3SS/DGuY3zF6lWx3Q2kdEQ6n
         oK7qImIXMFGyYaAAJmnEOPNBlIuzsHQdRDjDKHxwaq+JZOERMNCmgH3h/umlPJ/GDMax
         ycdUmq7ZXlwAPIKoTt20I7rzMvXD65bdmzWl7qBQfJF57LVg4mdjkMN2nDlyHJxp+/4w
         Bv0pQTVBLn0DOIdF6t+qIk2uMyXgS7vf6FboJGH9nxRZBCkjhV/OIiWrATXSl5yxw6ks
         GNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:references
         :in-reply-to:from:organization:delivered-to;
        bh=C9vFcjZDN/Fxaa0QMjaZwgnMDGjE5U9a9cC8FQf1Wik=;
        fh=trzqEJKyYBw3n01roX+QIoHQKLad71knxN4HASvT2+Y=;
        b=GZbJ4FARd0GD5HPatzOPGtGPA1HG4PwQKkuQR6igorLK0M0fQd5yr13Gw5RKP0pRRr
         QB72nVwkyPh1NZ3NaqQrTCnBq/cO2EEmq7EEaPMZXIX0gBlo61w4GB3Yq8v1FvmpzCKS
         Q2IVUxXsvVE7htZia494RmipiPfalyQDElwtnwF7IOJkQv7xqXL5MBkV6Odiqn4dOR2p
         43F6HtwTOKlABooPISYPuo/Y5W57h8oT3hChGg3fMEFwBRxHCDvztG4lGTRwNjAlBT0+
         6YtI0Etp+V//oZuWk2PNb/z8BOY+wHs3duuTepay2gSPdUlQNz0AOWHIPe3CI6iJ8RIL
         sqYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id n16-20020a05622a11d000b00432f37ba893si8397741qtk.122.2024.04.04.00.52.03
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 00:52:03 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-599-fUSPpjbqPBOPGQI5a6_YGw-1; Thu,
 04 Apr 2024 03:52:01 -0400
X-MC-Unique: fUSPpjbqPBOPGQI5a6_YGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E30363C02717
	for <linux-cachefs@gapps.redhat.com>; Thu,  4 Apr 2024 07:52:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DC02A2166B5D; Thu,  4 Apr 2024 07:52:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 739012166B33;
	Thu,  4 Apr 2024 07:51:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-22-dhowells@redhat.com>
References: <20240328163424.2781320-22-dhowells@redhat.com> <20240328163424.2781320-1-dhowells@redhat.com>
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
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH 21/26] netfs, 9p: Implement helpers for new write code
MIME-Version: 1.0
Date: Thu, 04 Apr 2024 08:51:51 +0100
Message-ID: <3655511.1712217111@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3655510.1712217111.1@warthog.procyon.org.uk>
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

David Howells <dhowells@redhat.com> wrote:

> +	size_t len = subreq->len - subreq->transferred;

This actually needs to be 'int len' because of the varargs packet formatter.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

