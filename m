Return-Path: <linux-cachefs+bncBDLIXLMFVAERBZXPSWWAMGQEVIMGU5Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1DA81C95D
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Dec 2023 12:49:59 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-67eee3fbeb1sf27747846d6.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 22 Dec 2023 03:49:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703245798; cv=pass;
        d=google.com; s=arc-20160816;
        b=OHBDnvE42qk8LSiuNoXfdpnR3u0HrxSyQcqmK5571nZxVVfFjvsm0gRn1KfF8hsyqM
         0TgTo3DDyp4/ykhBqcVkmWDN0vzSoTHu2l2rpGcO/qL5WIPolmMFmsxfAlN6N2J/pS4I
         tItObHKlboqHmnQTH3Yqf+SRJpArpteZlyj1/M9kygFp34HutQ5XavVVnBXh+5KV7tLk
         T7+UHPi1JWFyZkSIOKWKTxGQK6TL+YFYQAWK7dN2phlF3vEiJ7kSOO3WeLslJ39KHAFl
         +VarnX53YYsWv5Lp7070FsBbB2XvBpW9HsCudfc4zI1oPm0pkEn/dZqUCotqxURcU7bI
         hNjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=sa673dHnNTRHztIkY4buuqjlfOjtQCwEKZB6n3puCCg=;
        fh=gw8B5pDdwLsYBu/57pCI+HlHl3tS+eQk9FXUig0TBEg=;
        b=oKS51iubNFV6OhJa1rQ5I3Ge6OKaAeIWUMVgWRTFDTBXRd2R85pvHBHeLJQKwc+e0q
         EzYZEWeof2AWodAYXzLHjAbmnzXLuAjqsXpFpm4ql0HFaAVtGAXZ9cWsHcxtxdVdW/gn
         Y4EJnKJtYqqhktfPWl9Qw+2FtvLv8Z1rNXuDbIVnDL1bvdSUg6TWmfOWKz8HadQE0E5E
         DS35atdliCD2xVPRksBfhTta+tkEGfJgNOjlf1M+b/Fo2xZL7Ajtqo1gKcXR/wuGzzoQ
         uDvCjXCZeDiyIwS2Dg/JOf6gpsUcbS2bbZwxiRHfZWwpjRyEE84xgG+2YyIR7T0ZqjVo
         RkzQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703245798; x=1703850598;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sa673dHnNTRHztIkY4buuqjlfOjtQCwEKZB6n3puCCg=;
        b=dY3ljomW+QZaPOAa0mZVOeEn2wiDpLg7Q0mQ46lwEZ/YTEwNNa8NRCyBa7pfgiOxLT
         /U20ab0/9ipcIyxGEM6A1pIZ/xTxsv7nU5TgrP+iC1iZiobliHRi92nMv8ezOeSlMmcI
         Ck4BPE/hBiGlIChuOsY7ZHDRRKaCOrDEwS6v8Fvd4fyKcqqT+HtkSxyE4BzJwDGDS1Ym
         lc3pRb9Ds33YKODeBmQcAjI4v6b0KD7Wb01THkIF61g144a+pef1P5yU0advbmRwTF5X
         8E1tR4OIiCH1LIFa7O0EIxYs9gyrTddOE4ogUyHxvCE3FCINt/ENf9XnjagIW3Fg7Uce
         ZFGA==
X-Gm-Message-State: AOJu0YzBhgIEVnP7/B2u7LWMWNK5dtF0CbOOk9S2RWoGYrA+An6HeRv6
	JLEkaq0Wz9ypV+M/yvY/M2de3QhlxndR8w==
X-Google-Smtp-Source: AGHT+IHtrcWOPg06BHETre2u1F8+bivlBWR9i722049kX4hxKZnzAs7jguvlTURrJFdec0s+EDxysg==
X-Received: by 2002:a05:6214:2245:b0:67f:8b8f:6fc7 with SMTP id c5-20020a056214224500b0067f8b8f6fc7mr2118812qvc.1.1703245798403;
        Fri, 22 Dec 2023 03:49:58 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1bc9:b0:67a:b34a:6626 with SMTP id
 m9-20020a0562141bc900b0067ab34a6626ls3470823qvc.0.-pod-prod-05-us; Fri, 22
 Dec 2023 03:49:57 -0800 (PST)
X-Received: by 2002:a05:6214:27c1:b0:67f:7aa:2b75 with SMTP id ge1-20020a05621427c100b0067f07aa2b75mr1221669qvb.104.1703245797734;
        Fri, 22 Dec 2023 03:49:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703245797; cv=none;
        d=google.com; s=arc-20160816;
        b=RFxQhkPjjZ2VxetUezHPj1s8c/GVq/cys0UhbTSvSphQcqSwEYWhFOdkoRjweTc4Dy
         AF/2+tksGX6MD6YWG5gq4MC4PTX34W+sC3+S3VOyjgd+fNCxbpH8ZCoc0NsC9pOJ9QCF
         camm5EQ6oi2AFyMBvns+mr9+480omtAzacPFT433nye7zxXqi52MuKLPXIfSKqSSadAZ
         in+X/Iu1ifwg9IBOu/Zvn4ru06JwE8One7jrtICTROwIOQAJK9Mh8lDFmZCfiCk74mWU
         GBscCbXAeJ6qsg9rZUr7Bl82E3SXltZvKcEhBcjL/g1rjPmVjs3NGdubvml3MJyPtFcv
         uLaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=b2Kc5SDyR2sa98m7GGfG0OJjTCYVmXAF9D404GjbeCw=;
        fh=gw8B5pDdwLsYBu/57pCI+HlHl3tS+eQk9FXUig0TBEg=;
        b=oH35MH10i/J+LXdSQW+bGg0MIp+dC5eUWFz9hKXHwaXEDopIFoRKYSSrYyLJKZkXhb
         zSmtY3zSME/ZA49TMkSlzMlHTlZ+OvxX1u9EeESEOqwdI/eWis5u1eteeH9N+1pv+mfQ
         E/0R2BdcnuwcLKHBrBAN5o/haSHmpimAzmMac5pP49bKG9bnb0vhpKGovUBdBOgDfuxQ
         oZX0gc9LHsA+OPB/dU9gVEZrAz/1c4OETe2zQUoqaz3qdYl9rVZK1QlTdcNSQT/IC8zu
         i9Sog1SToH0w8D7/xahrvTSYF01Oy7r1Zx5ciyfEYYxfO6hXjCrpQTp0/w8XRmLNy02P
         I//Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id p1-20020a0ccb81000000b0067f5182055esi4194701qvk.24.2023.12.22.03.49.57
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 03:49:57 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-606-HIijncz3NCONbbf2RZNGDg-1; Fri,
 22 Dec 2023 06:49:56 -0500
X-MC-Unique: HIijncz3NCONbbf2RZNGDg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 054723C29A75
	for <linux-cachefs@gapps.redhat.com>; Fri, 22 Dec 2023 11:49:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 018C32026F95; Fri, 22 Dec 2023 11:49:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71FCC2026D66;
	Fri, 22 Dec 2023 11:49:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20231221230153.GA1607352@dev-arch.thelio-3990X>
References: <20231221230153.GA1607352@dev-arch.thelio-3990X> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-38-dhowells@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>,
    Anna Schumaker <Anna.Schumaker@Netapp.com>,
    Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
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
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 37/40] netfs: Optimise away reads above the point at which there can be no data
MIME-Version: 1.0
Date: Fri, 22 Dec 2023 11:49:51 +0000
Message-ID: <2202548.1703245791@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2202547.1703245791.1@warthog.procyon.org.uk>
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

Nathan Chancellor <nathan@kernel.org> wrote:

> It appears that ctx->inode.i_mapping is NULL in netfs_inode_init(). This
> patch appears to cure the problem for me but I am not sure if it is
> proper or not.

I'm not sure that's the best way.  It kind of indicates that
nfs_netfs_inode_init() is not being called in the right place - it should
really be called after alloc_inode() has called inode_init_always().

However, mapping_set_release_always() makes ->release_folio() and
->invalidate_folio() always called for an inode's folios, even if PG_private
is not set - the idea being that this allows netfslib to update the
"zero_point" when a page we've written to the server gets invalidated here,
thereby requiring us to go fetch it again.

Now, NFS doesn't make use of this feature and fscache and cachefiles don't use
it directly, so we might not want to call mapping_set_release_always() for
NFS.

I'm not sure NFS can even reliably make use of it unless it's using a lease
unless it gets change notifications from the server.

So I'm thinking of applying your patch but add a comment to say why we're
doing it.  A better way, though, is to move the call to nfs_netfs_inode_init()
and give it a flag to say whether or not we want the facility.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

